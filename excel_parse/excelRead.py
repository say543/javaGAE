import xlrd
import sys
import datetime
import os
import time
import pymysql.cursors

# for checkbox read
import win32com.client as win32
 
#----------------------------------------------------------------------

"""
dispatch function at first for future
def get_checkbox(path):
    excel = win32.gencache.EnsureDispatch("Excel.Application")
    prefix = "C:\\javaGAE\\excel_parse\\"
    abspath = prefix +path
    #print (abspath)
    wb = excel.Workbooks.Open(abspath)
    ws = wb.Worksheets("sheet1")
    #cb_dict = {}
    #for cb in ws.Checkboxes():
    #    print (cb.value)

    #excel.Application.Quit()
"""    
#----------------------------------------------------------------------
def open_file(path):

    matrix = [];
    # parse range 
    rlist = [9, 10, 11, 12, 13, 14]
    
    """
    Open and read an Excel file
    """
    
    book = xlrd.open_workbook(path)
    for x in range(0, book.nsheets):
        record = [];
        print(x)
        sheet = book.sheet_by_index(x)
        #print(sheet.name)
        #print(sheet.nrows)
        #print(sheet.ncols)

        # append name as identifier
        record.append(sheet.name)
        
         # read first line table
        for ri in rlist:
            if ri != 13 and ri != 14:
                clist = [13,16]
            else:
                clist = [13]
                
            for ci in clist:
                cell = sheet.cell(ri,ci)
                celltype = sheet.cell_type(ri,ci)
                # detect empty cells
                if celltype == xlrd.XL_CELL_EMPTY:
                    record.append('') 
                    continue
                if ri == 10:
                    date_values = datetime.datetime(*xlrd.xldate_as_tuple(cell.value, book.datemode))
                    datecom = str(date_values.year)+'-'+str(date_values.month)+'-'+str(date_values.day)
                    record.append(datecom)
                    #print (date_values.year,'-',date_values.month,'-',date_values.day)
                else:
                    record.append(cell.value)
                    #print (cell.value)
                        
                    

        # W13, barcode scanning(hidden field)
        # true or false
        if (sheet.ncols >=22):
            cell = sheet.cell(12,22)
            celltype = sheet.cell_type(12,22)
            if celltype == xlrd.XL_CELL_EMPTY:
                record.append('')
            else:
                if (cell.value == 1):
                    record.append('true')
                else:
                    record.append('false')
        else:
            record.append('')
            
        #print (cell.value)            
        # note
        # O17, notes
        cell = sheet.cell(16,14)
        celltype = sheet.cell_type(16,14)
        if celltype == xlrd.XL_CELL_EMPTY:
            record.append('')
        else:
            record.append(cell.value)
        #print (cell.value)

        #file link
        fileCombi = 'file:///'+path
        fileAbs = fileCombi.replace('\\','\\\\')
        
        #print(path+sheet.name)
        record.append(fileAbs)
        
        matrix.append(record)
    
    return matrix;




#----------------------------------------------------------------------
def db_update(path,files):  
    try:
        connection = pymysql.connect(host='localhost',
                             user='root',
                             passwd='ve81P491@',
                             db='sakila',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
        with connection.cursor() as cursor:
            # Create a new record
            #command ="INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2\"; 94x230','3 phase PDP1-70ms','LKO humidified',1,'','link unappend')"
            #cursor.execute(command)
            for file in files:
                matrix = open_file(os.path.join(path,file))
                

                

                #INSERT INTO  record VALUES (1,'Craig', 'T6k14C1', '2015-2-13', '2015-2-13', 50.3,  4.4, 'solid white', '2\"; 94X30', '5vPDP1_100ms', 'LKO', 1, '2nd round failed', 'link1');
                for record in matrix:

                    # delete old record at first
                    #Delete from record where id = '23C-55RH sample 40C-A'
                    if len(record) > 0:
                        command = 'DELETE FROM record WHERE id='+'\''+str(record[0])+'\''
                        print(command)
                        cursor.execute(command)
                        
                    
                    command =  'INSERT INTO record VALUES (';
                    for index in range(0,len(record)):
                        if index == 0:                           
                            command = command+ '\''+str(record[index])+'\''
                        elif index == 3 or index == 4 or index == 11:
                            if (str(record[index]) == ''):
                                # default date / boolean string
                                command = command+',DEFAULT' 
                            else:
                                command = command+',\''+str(record[index])+'\''
                        elif index == 5 or index == 6:
                            if (str(record[index]) == ''):
                                # default double
                                command = command+',DEFAULT' 
                            else:
                                command = command+ ','+str(record[index])
                        else:
                            command = command+',\''+str(record[index])+'\''                           
                    command = command+')'
                    # output command for debug
                    print(command)


        


                    
                    cursor.execute(command)
    
        connection.commit()

    finally:
        connection.close()

    """
    for file in files:
        matrix = open_file(os.path.join(path,file))
        #INSERT INTO  record VALUES (1,'Craig', 'T6k14C1', '2015-2-13', '2015-2-13', 50.3,  4.4, 'solid white', '2\"; 94X30', '5vPDP1_100ms', 'LKO', 1, '2nd round failed', 'link1');
        for record in matrix:
            command =  'INSERT INTO record VALUES (DEFAULT,';
            for index in range(0,len(record)):
                if index == 0:                           
                    command = command+ '\''+str(record[index])+'\''
                elif index == 4 or index == 5 or index == 10:
                    command = command+ ','+str(record[index])                           
                else:
                    command = command+',\''+str(record[index])+'\''                           
            command = command+');\n'
            print(command)
    """


    
    
#----------------------------------------------------------------------
if __name__ == "__main__":
    # argument passing and test
    """
    print ('Number of arguments', len(sys.argv))
    print ('Argument list ', str(sys.argv))
    if len(sys.argv) >=2:
        print ('filename', sys.argv[0])
        print ('filename', sys.argv[1])
    """    

    
    # list file in fix directory
    path = 'C:\\javaGAE\\excel_parse\\excel'
    #path = 'C:\\javaGAE\\excel_parse\\excel\\uncompleted excel'
    #path = '\\\\siifs\\sii\\QAQC\FPL QC items\\Blooming Test Result\\2 inch TFT\\2015'
    dayses = 86400
    files = [f for f in os.listdir(path)
             if os.path.isfile(os.path.join(path,f))
             and f.endswith(".xlsm")
             #and (time.time() - os.path.getmtime(os.path.join(path,f))) <= dayses  
             ]

    
    #files = [f for f in os.listdir(path)]
    print(len(files))
    # time in second, current time
    #currenttime = time.time()
    #for f in files:
        # second
        #print (os.path.getmtime(os.path.join(path,f)))
        # different in secpnd
        #print ( currenttime - os.path.getmtime(os.path.join(path,f)))
        # day time
        #print ( time.ctime(os.path.getmtime(os.path.join(path,f))))
        #print ( currenttime - os.path.getmtime(os.path.join(path,f)))
    # string  replace test
    #a = 'this \\ string example....wow!!! this is really string'
    #a = '\\test\\test'
    #print(a)
    #b = a.replace('\\', '\\\\')
    #print(b)   
    # database  online update
    db_update(path, files)

    
    # file output
    '''
    fo = open("records.txt", "w")
    for file in files:
        matrix = open_file(os.path.join(path,file))
        #fo.write(file+'\n')
        #INSERT INTO  record VALUES (1,'Craig', 'T6k14C1', '2015-2-13', '2015-2-13', 50.3,  4.4, 'solid white', '2\"; 94X30', '5vPDP1_100ms', 'LKO', 'true', '2nd round failed', 'link1');
        for record in matrix:
            #print(record)
            fo.write('INSERT INTO record VALUES (')
            for index in range(0,len(record)):
                if index == 0:                           
                    fo.write('\''+str(record[index])+'\'')
                elif index == 3 or index == 4 or index == 11:
                    if (str(record[index]) == ''):
                        # default date / boolean string
                        fo.write(',DEFAULT')
                    else:
                        fo.write(',\''+str(record[index])+'\'')
                elif index == 5 or index == 6 :
                    if (str(record[index]) == ''):
                        # default double
                        fo.write(',DEFAULT')
                    else:
                        fo.write(','+str(record[index]))
                else:
                    fo.write(',\''+str(record[index])+'\'')                           
            #fo.write(bytes(str(')\n'), 'UTF-8'))
            fo.write(');\n')

            
    fo.close()
    '''
