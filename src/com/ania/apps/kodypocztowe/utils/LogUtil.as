/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.utils
{
    import flash.utils.getQualifiedClassName;

    import mx.logging.ILogger;
    import mx.logging.Log;

    public class LogUtil
    {
        /**
         * Get a logger for
         */
        public static function getLogger(obj:Object):ILogger
        {
            return Log.getLogger(getQualifiedClassName(obj).replace("::", "."));
        }
    }
}
