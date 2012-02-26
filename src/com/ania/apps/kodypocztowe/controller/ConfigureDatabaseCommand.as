/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.controller
{
    import com.ania.apps.kodypocztowe.services.helpers.ISQLRunnerDelegate;
    import com.ania.apps.kodypocztowe.services.helpers.SQLRunnerDelegate;

    import flash.filesystem.File;

    import org.robotlegs.mvcs.SignalCommand;

    public class ConfigureDatabaseCommand extends SignalCommand
    {
        private static const DB_FILE_NAME:String = "data/kody_pocztowe.sqlite";

        override public function execute():void
        {
            var dbFile:File = File.applicationDirectory.resolvePath(DB_FILE_NAME);
            var sqlRunner:ISQLRunnerDelegate = new SQLRunnerDelegate(dbFile);

            injector.mapValue(ISQLRunnerDelegate, sqlRunner);

            if (!dbFile.exists)
            {
                //We use the injector to instantiate the DatabaseCreator here because
                //we want to inject the SQLRunner that is mapped above. This works
                //well even though the DatabaseCreator is not a mapped object, we still
                //get access to injections from Robotlegs by creating it this way!

//                var creator:DatabaseCreator = injector.instantiate(DatabaseCreator);
//                creator.createDatabaseStructure();
            }
            else
            {
//                dispatch(new DatabaseReadyEvent());
            }
        }
    }
}