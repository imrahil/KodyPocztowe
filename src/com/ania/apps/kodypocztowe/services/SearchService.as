/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.services
{
    import com.ania.apps.kodypocztowe.utils.LogUtil;

    import mx.logging.ILogger;

    import org.robotlegs.mvcs.Actor;

    public class SearchService extends Actor implements ISearchService
    {
        private var logger:ILogger;

        public function SearchService()
        {
            super();

            logger = LogUtil.getLogger(this);
            logger.debug(": constructor");
        }


        public function searchZipCode():void
        {
        }

        public function showAddress(zipCode:String):void
        {
        }
    }
}
