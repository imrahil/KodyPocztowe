/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.services.helpers
{
    public interface ISQLRunnerDelegate
    {
        function get numConnections():int;

        function get connectionErrorHandler():Function;

        function set connectionErrorHandler(value:Function):void;

        function execute(sql:String, parameters:Object, handler:Function, itemClass:Class = null, errorHandler:Function = null):void;

        function close(resultHandler:Function, errorHandler:Function = null):void;
    }
}