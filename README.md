# protected_method
[![Travis CI](https://travis-ci.org/monkstone/protected_method.svg)](https://monkstone/protected_method)

Since JDK9 there is a need for java integration test with jruby, in this example we test the ability to call an inherited / protected java method from jruby.

Use rake to compile and run test.

Using jruby-9.1.14.0

### output jdk8
openjdk version "1.8.0_151"
OpenJDK Runtime Environment (build 1.8.0_151-8u151-b12-0ubuntu0.16.04.2-b12)
OpenJDK 64-Bit Server VM (build 25.151-b12, mixed mode)

```pre
1
```

### output jdk9.0.1 (with full backtrace)

java version "9.0.1"
Java(TM) SE Runtime Environment (build 9.0.1+11)
Java HotSpot(TM) 64-Bit Server VM (build 9.0.1+11, mixed mode)

```pre
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by jnr.posix.JavaLibCHelper$ReflectiveAccess to method sun.nio.ch.SelChImpl.getFD()
WARNING: Please consider reporting this to the maintainers of jnr.posix.JavaLibCHelper$ReflectiveAccess
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
TypeError: illegal access on 'test_method': class org.jruby.javasupport.JavaMethod cannot access a member of class monkstone.ProtectedSuper with modifiers "protected"
                      getStackTrace at java/lang/Thread.java:1654
                   getBacktraceData at org/jruby/runtime/backtrace/TraceType.java:246
                       getBacktrace at org/jruby/runtime/backtrace/TraceType.java:47
                   prepareBacktrace at org/jruby/RubyException.java:235
                           preRaise at org/jruby/exceptions/RaiseException.java:216
                           preRaise at org/jruby/exceptions/RaiseException.java:183
                             <init> at org/jruby/exceptions/RaiseException.java:111
                  newRaiseException at org/jruby/Ruby.java:4138
                       newTypeError at org/jruby/Ruby.java:3809
              handleIllegalAccessEx at org/jruby/javasupport/JavaCallable.java:169
  invokeDirectWithExceptionHandling at org/jruby/javasupport/JavaMethod.java:443
                 tryProxyInvocation at org/jruby/javasupport/JavaMethod.java:623
                       invokeDirect at org/jruby/javasupport/JavaMethod.java:299
                               call at org/jruby/java/invokers/InstanceMethodInvoker.java:36
                       cacheAndCall at org/jruby/runtime/callsite/CachingCallSite.java:298
                               call at org/jruby/runtime/callsite/CachingCallSite.java:127
           invokeOther7:test_method at ruby_protected.rb:12
                         initialize at ruby_protected.rb:12
                               call at org/jruby/internal/runtime/methods/CompiledIRMethod.java:90
                       cacheAndCall at org/jruby/runtime/callsite/CachingCallSite.java:308
                               call at org/jruby/runtime/callsite/CachingCallSite.java:137
                        newInstance at org/jruby/RubyClass.java:994
                               call at org/jruby/RubyClass$INVOKER$i$newInstance.gen:-1
                               call at org/jruby/internal/runtime/methods/DynamicMethod.java:192
                               call at org/jruby/java/proxies/ConcreteJavaProxy.java:151
                       cacheAndCall at org/jruby/runtime/callsite/CachingCallSite.java:298
                               call at org/jruby/runtime/callsite/CachingCallSite.java:127
                  invokeOther10:new at ruby_protected.rb:17
                             <main> at ruby_protected.rb:17
                invokeWithArguments at java/lang/invoke/MethodHandle.java:638
                               load at org/jruby/ir/Compiler.java:95
                          runScript at org/jruby/Ruby.java:828
                        runNormally at org/jruby/Ruby.java:747
                        runNormally at org/jruby/Ruby.java:765
                        runFromMain at org/jruby/Ruby.java:578
                      doRunFromMain at org/jruby/Main.java:417
                        internalRun at org/jruby/Main.java:305
                                run at org/jruby/Main.java:232
                               main at org/jruby/Main.java:204


```
