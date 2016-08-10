﻿Перем юТест;

Функция Версия() Экспорт
	Возврат "0.1";
КонецФункции

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

	юТест = ЮнитТестирование;

	ВсеТесты = Новый Массив;

	СИ = Новый СистемнаяИнформация;
	Если (Найти(СИ.ВерсияОС, "Windows") > 0) И Не (СИ.ПеременныеСреды().Получить("APPVEYOR") = "True") Тогда
		ВсеТесты.Добавить("ТестДолжен_ПроверитьУстановкуЧисловыхСвойств");
		ВсеТесты.Добавить("ТестДолжен_ПроверитьВызовСОпциональнымиПараметрами");
	КонецЕсли;

	Возврат ВсеТесты;
КонецФункции

Процедура ТестДолжен_ПроверитьУстановкуЧисловыхСвойств() Экспорт

	conn = Новый ComObject("ADODB.Connection");
	conn.ConnectionString = "Driver={MySQL ODBC 3.51 Driver}; Server=obr-mdb-01; Port=3306; UID=v8; PWD=G0bl1n76; database=db1cprod; option=3;";
	conn.CommandTimeOut= 30;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьВызовСОпциональнымиПараметрами() Экспорт

	conn = Новый ComObject("ADODB.Connection");
	conn.ConnectionString = "Driver={fake driver}; Server=obr-mdb-01; Port=3306; UID=v8; PWD=G0bl1n76; database=db1cprod; option=3;";
	conn.CommandTimeOut= 30;

	Попытка
		conn.Open(,,);
	Исключение
		Инфо = ИнформацияОбОшибке().Причина;
		Если Инфо = Неопределено Тогда
			Инфо = ИнформацияОбОшибке();
		КонецЕсли;

		юТест.ПроверитьИстину(Найти(Строка(Инфо),"[Microsoft]") > 0, ИнформацияОбОшибке().Описание);
	КонецПопытки;

КонецПроцедуры
