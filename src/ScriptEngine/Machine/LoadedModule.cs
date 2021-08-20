﻿/*----------------------------------------------------------
This Source Code Form is subject to the terms of the
Mozilla Public License, v.2.0. If a copy of the MPL
was not distributed with this file, You can obtain one
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/

using System;
using System.Collections.Generic;
using OneScript.Contexts;
using OneScript.Sources;
using OneScript.Values;
using ScriptEngine.Machine.Contexts;

namespace ScriptEngine.Machine
{
    public class LoadedModule : IExecutableModule
    {
        public LoadedModule(Type ownerType)
        {
            ClassType = ownerType;
        }
        
        public LoadedModule() : this(typeof(UserScriptContextInstance))
        {
        }

        public Type ClassType { get; }
        
        public int LoadAddress { get; set; }
        
        public int EntryMethodIndex { get; set; }

        public List<BslPrimitiveValue> Constants { get; } = new List<BslPrimitiveValue>();
        
        public IList<SymbolBinding> VariableRefs { get; } = new List<SymbolBinding>();
        
        public IList<SymbolBinding> MethodRefs { get; } = new List<SymbolBinding>();

        public IList<BslAnnotationAttribute> ModuleAttributes { get; } = new List<BslAnnotationAttribute>();
        
        public IList<BslFieldInfo> Fields { get; } = new List<BslFieldInfo>();
        
        public IList<BslPropertyInfo> Properties { get; } = new List<BslPropertyInfo>();

        public IList<BslMethodInfo> Methods { get; } = new List<BslMethodInfo>();

        internal List<MethodDescriptor> RuntimeMethods { get; } = new List<MethodDescriptor>();

        //internal IList<MachineBslMethodInfo> RuntimeMethods { get; } = new List<MachineBslMethodInfo>();
        
        public IList<Command> Code { get; } = new List<Command>(512);

        public SourceCode Source { get; set; }
    }
}