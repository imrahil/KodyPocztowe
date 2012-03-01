/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.services
{
    import com.ania.apps.kodypocztowe.model.KodyPocztoweModel;
    import com.ania.apps.kodypocztowe.model.vo.SearchAreaVO;
    import com.ania.apps.kodypocztowe.model.vo.ZipCodeVO;
    import com.ania.apps.kodypocztowe.services.helpers.ISQLRunnerDelegate;
    import com.ania.apps.kodypocztowe.utils.LogUtil;

    import flash.data.SQLResult;
    import flash.errors.SQLError;

    import mx.collections.ArrayCollection;

    import mx.logging.ILogger;

    import org.robotlegs.mvcs.Actor;

    public class SearchService extends Actor implements ISearchService
    {
        [Inject]
        public var sqlRunner:ISQLRunnerDelegate;

        [Inject]
        public var kodyPocztoweModel:KodyPocztoweModel;

        private var logger:ILogger;

        [Embed(source="/assets/sql/ShowAddress.sql", mimeType="application/octet-stream")]
        private static const ShowAddressStatementText:Class;
        public static const SHOW_ADDRESS_SQL:String = new ShowAddressStatementText();

        [Embed(source="/assets/sql/SearchZipCode.sql", mimeType="application/octet-stream")]
        private static const SearchZipCodeStatementText:Class;
        public static const SEARCH_ZIP_CODE_SQL:String = new SearchZipCodeStatementText();

        public function SearchService()
        {
            super();

            logger = LogUtil.getLogger(this);
            logger.debug(": constructor");
        }

        /**
         * Search for zip-codes using provided city and street
         * @param searchAreaVO
         */
        public function searchZipCode(searchAreaVO:SearchAreaVO):void
        {
            sqlRunner.execute(SEARCH_ZIP_CODE_SQL, {city: '%' + searchAreaVO.city + '%', street: '%' + searchAreaVO.street + '%'}, resultHandler, ZipCodeVO, errorHandler);
        }

        /**
         * Search for detailed information using provided zip-code
         * @param zipCode
         */
        public function showAddress(zipCode:String):void
        {
            sqlRunner.execute(SHOW_ADDRESS_SQL, {zipCode:zipCode}, resultHandler, ZipCodeVO, errorHandler);
        }

        private function resultHandler(result:SQLResult):void
        {
            kodyPocztoweModel.addresses = new ArrayCollection(result.data);
        }

        private function errorHandler(error:SQLError):void
        {
            logger.error("Error: " + error.details);
        }
    }
}
