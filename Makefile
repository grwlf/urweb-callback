# This Makefile was generated by the Cake3
# https://github.com/grwlf/cake3

GUARD = .cake3/GUARD_$(1)_$(shell echo $($(1)) | md5sum | cut -d ' ' -f 1)

ifeq ($(MAIN),1)
unexport MAIN

# Main section

URCPP = $(shell $(shell urweb -print-ccompiler) -print-prog-name=g++)
URINCL = -I$(shell urweb -print-cinclude) 
URVERSION = $(shell urweb -version)
.PHONY: all
all: ./Makefile ./demo/Demo2.db ./demo/Demo2.exe ./demo/Demo2.sql ./test/Stress1.db ./test/Stress1.exe ./test/Stress1.sql ./test2/Notify.db ./test2/Notify.exe ./test2/Notify.sql ./test2/Simple1.db ./test2/Simple1.exe ./test2/Simple1.sql ./test2/Stdout.db ./test2/Stdout.exe ./test2/Stdout.sql ./test2/Stress.db ./test2/Stress.exe ./test2/Stress.sql
./demo/Demo2.db: ./Makefile ./demo/Demo2.exe ./demo/Demo2.sql
	dropdb --if-exists Demo2
	createdb Demo2
	psql -f ./demo/Demo2.sql Demo2
	touch ./demo/Demo2.db
./test2/Notify.db: ./Makefile ./test2/Notify.exe ./test2/Notify.sql
	dropdb --if-exists Notify
	createdb Notify
	psql -f ./test2/Notify.sql Notify
	touch ./test2/Notify.db
./test2/Stress.db: ./Makefile ./test2/Stress.exe ./test2/Stress.sql
	dropdb --if-exists Stress
	createdb Stress
	psql -f ./test2/Stress.sql Stress
	touch ./test2/Stress.db
./test2/Stdout.db: ./Makefile ./test2/Stdout.exe ./test2/Stdout.sql
	dropdb --if-exists Stdout
	createdb Stdout
	psql -f ./test2/Stdout.sql Stdout
	touch ./test2/Stdout.db
./test2/Simple1.db: ./Makefile ./test2/Simple1.exe ./test2/Simple1.sql
	dropdb --if-exists Simple1
	createdb Simple1
	psql -f ./test2/Simple1.sql Simple1
	touch ./test2/Simple1.db
./test/Stress1.db: ./Makefile ./test/Stress1.exe ./test/Stress1.sql
	dropdb --if-exists Stress1
	createdb Stress1
	psql -f ./test/Stress1.sql Stress1
	touch ./test/Stress1.db
.PHONY: lib
lib: ./Makefile ./lib.urp
.PHONY: demo
demo: ./Makefile ./demo/Demo2.db
./demo/Demo2.exe: .fix-multy1
./demo/Demo2.urp: ./Makefile ./demo/Demo2.ur ./demo/Demo2.urs ./lib.urp .cake3/tmp_Demo2.in
	cat .cake3/tmp_Demo2.in > ./demo/Demo2.urp
.cake3/tmp_Demo2.in: ./Makefile
	-rm -rf .cake3/tmp_Demo2.in
	echo 'database dbname=Demo2' >> .cake3/tmp_Demo2.in
	echo 'safeGet Demo2/main' >> .cake3/tmp_Demo2.in
	echo 'safeGet Demo2/monitor' >> .cake3/tmp_Demo2.in
	echo 'allow env PING' >> .cake3/tmp_Demo2.in
	echo 'sql .././demo/Demo2.sql' >> .cake3/tmp_Demo2.in
	echo 'library ../.' >> .cake3/tmp_Demo2.in
	echo '' >> .cake3/tmp_Demo2.in
	echo '$$/list' >> .cake3/tmp_Demo2.in
	echo '$$/char' >> .cake3/tmp_Demo2.in
	echo '$$/string' >> .cake3/tmp_Demo2.in
	echo '.././demo/Demo2' >> .cake3/tmp_Demo2.in
./lib.urp: ./Callback.ur ./Callback.urs ./CallbackFFI.h ./CallbackFFI.o ./CallbackNotify.ur ./CallbackNotify.urs ./CallbackNotify2.ur ./CallbackNotify2.urs ./Makefile .cake3/tmp_lib.in
	cat .cake3/tmp_lib.in > ./lib.urp
.cake3/tmp_lib.in: ./Makefile
	-rm -rf .cake3/tmp_lib.in
	echo 'ffi ./CallbackFFI' >> .cake3/tmp_lib.in
	echo 'include ./CallbackFFI.h' >> .cake3/tmp_lib.in
	echo 'link ./CallbackFFI.o' >> .cake3/tmp_lib.in
	echo 'link -lstdc++' >> .cake3/tmp_lib.in
	echo 'safeGet Callback/Default/callback' >> .cake3/tmp_lib.in
	echo 'safeGet CallbackNotify/Default/C/callback' >> .cake3/tmp_lib.in
	echo '' >> .cake3/tmp_lib.in
	echo '$$/list' >> .cake3/tmp_lib.in
	echo './Callback' >> .cake3/tmp_lib.in
	echo './CallbackNotify' >> .cake3/tmp_lib.in
	echo './CallbackNotify2' >> .cake3/tmp_lib.in
./test2/Notify.exe: .fix-multy3
./test2/Notify.urp: ./Makefile ./lib.urp ./test2/Notify.ur ./test2/Templ.ur .cake3/tmp_Notify.in
	cat .cake3/tmp_Notify.in > ./test2/Notify.urp
.cake3/tmp_Notify.in: ./Makefile
	-rm -rf .cake3/tmp_Notify.in
	echo 'debug' >> .cake3/tmp_Notify.in
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp_Notify.in
	echo 'allow mime text/javascript' >> .cake3/tmp_Notify.in
	echo 'allow mime text/css' >> .cake3/tmp_Notify.in
	echo 'allow mime image/jpeg' >> .cake3/tmp_Notify.in
	echo 'allow mime image/png' >> .cake3/tmp_Notify.in
	echo 'allow mime image/gif' >> .cake3/tmp_Notify.in
	echo 'database dbname=Notify' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/main' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/job_monitor' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/src_monitor' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/job_start' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/finished' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/cleanup' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/monitor' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/run' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/C/callback' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/C/C/callback' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/cnt' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/Find/C/callback' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/Cat/C/callback' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/viewsrc' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/status' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/lastline' >> .cake3/tmp_Notify.in
	echo 'safeGet Notify/longrunning' >> .cake3/tmp_Notify.in
	echo 'sql .././test2/Notify.sql' >> .cake3/tmp_Notify.in
	echo 'library ../.' >> .cake3/tmp_Notify.in
	echo '' >> .cake3/tmp_Notify.in
	echo '$$/list' >> .cake3/tmp_Notify.in
	echo '$$/string' >> .cake3/tmp_Notify.in
	echo '.././test2/Templ' >> .cake3/tmp_Notify.in
	echo '.././test2/Notify' >> .cake3/tmp_Notify.in
./test2/Stress.exe: .fix-multy6
./test2/Stress.urp: ./Makefile ./lib.urp ./test2/Stress.ur ./test2/Templ.ur .cake3/tmp_Stress.in
	cat .cake3/tmp_Stress.in > ./test2/Stress.urp
.cake3/tmp_Stress.in: ./Makefile
	-rm -rf .cake3/tmp_Stress.in
	echo 'debug' >> .cake3/tmp_Stress.in
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp_Stress.in
	echo 'allow mime text/javascript' >> .cake3/tmp_Stress.in
	echo 'allow mime text/css' >> .cake3/tmp_Stress.in
	echo 'allow mime image/jpeg' >> .cake3/tmp_Stress.in
	echo 'allow mime image/png' >> .cake3/tmp_Stress.in
	echo 'allow mime image/gif' >> .cake3/tmp_Stress.in
	echo 'database dbname=Stress' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/main' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/job_monitor' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/src_monitor' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/job_start' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/finished' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/cleanup' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/monitor' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/run' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/C/callback' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/C/C/callback' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/cnt' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/Find/C/callback' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/Cat/C/callback' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/viewsrc' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/status' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/lastline' >> .cake3/tmp_Stress.in
	echo 'safeGet Stress/longrunning' >> .cake3/tmp_Stress.in
	echo 'sql .././test2/Stress.sql' >> .cake3/tmp_Stress.in
	echo 'library ../.' >> .cake3/tmp_Stress.in
	echo '' >> .cake3/tmp_Stress.in
	echo '$$/list' >> .cake3/tmp_Stress.in
	echo '$$/string' >> .cake3/tmp_Stress.in
	echo '.././test2/Templ' >> .cake3/tmp_Stress.in
	echo '.././test2/Stress' >> .cake3/tmp_Stress.in
./test2/Stdout.exe: .fix-multy5
./test2/Stdout.urp: ./Makefile ./lib.urp ./test2/Stdout.ur ./test2/Templ.ur .cake3/tmp_Stdout.in
	cat .cake3/tmp_Stdout.in > ./test2/Stdout.urp
.cake3/tmp_Stdout.in: ./Makefile
	-rm -rf .cake3/tmp_Stdout.in
	echo 'debug' >> .cake3/tmp_Stdout.in
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp_Stdout.in
	echo 'allow mime text/javascript' >> .cake3/tmp_Stdout.in
	echo 'allow mime text/css' >> .cake3/tmp_Stdout.in
	echo 'allow mime image/jpeg' >> .cake3/tmp_Stdout.in
	echo 'allow mime image/png' >> .cake3/tmp_Stdout.in
	echo 'allow mime image/gif' >> .cake3/tmp_Stdout.in
	echo 'database dbname=Stdout' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/main' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/job_monitor' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/src_monitor' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/job_start' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/finished' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/cleanup' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/monitor' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/run' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/C/callback' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/C/C/callback' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/cnt' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/Find/C/callback' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/Cat/C/callback' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/viewsrc' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/status' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/lastline' >> .cake3/tmp_Stdout.in
	echo 'safeGet Stdout/longrunning' >> .cake3/tmp_Stdout.in
	echo 'sql .././test2/Stdout.sql' >> .cake3/tmp_Stdout.in
	echo 'library ../.' >> .cake3/tmp_Stdout.in
	echo '' >> .cake3/tmp_Stdout.in
	echo '$$/list' >> .cake3/tmp_Stdout.in
	echo '$$/string' >> .cake3/tmp_Stdout.in
	echo '.././test2/Templ' >> .cake3/tmp_Stdout.in
	echo '.././test2/Stdout' >> .cake3/tmp_Stdout.in
./test2/Simple1.exe: .fix-multy4
./test2/Simple1.urp: ./Makefile ./lib.urp ./test2/Simple1.ur ./test2/Templ.ur .cake3/tmp_Simple1.in
	cat .cake3/tmp_Simple1.in > ./test2/Simple1.urp
.cake3/tmp_Simple1.in: ./Makefile
	-rm -rf .cake3/tmp_Simple1.in
	echo 'debug' >> .cake3/tmp_Simple1.in
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp_Simple1.in
	echo 'allow mime text/javascript' >> .cake3/tmp_Simple1.in
	echo 'allow mime text/css' >> .cake3/tmp_Simple1.in
	echo 'allow mime image/jpeg' >> .cake3/tmp_Simple1.in
	echo 'allow mime image/png' >> .cake3/tmp_Simple1.in
	echo 'allow mime image/gif' >> .cake3/tmp_Simple1.in
	echo 'database dbname=Simple1' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/main' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/job_monitor' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/src_monitor' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/job_start' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/finished' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/cleanup' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/monitor' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/run' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/C/callback' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/C/C/callback' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/cnt' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/Find/C/callback' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/Cat/C/callback' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/viewsrc' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/status' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/lastline' >> .cake3/tmp_Simple1.in
	echo 'safeGet Simple1/longrunning' >> .cake3/tmp_Simple1.in
	echo 'sql .././test2/Simple1.sql' >> .cake3/tmp_Simple1.in
	echo 'library ../.' >> .cake3/tmp_Simple1.in
	echo '' >> .cake3/tmp_Simple1.in
	echo '$$/list' >> .cake3/tmp_Simple1.in
	echo '$$/string' >> .cake3/tmp_Simple1.in
	echo '.././test2/Templ' >> .cake3/tmp_Simple1.in
	echo '.././test2/Simple1' >> .cake3/tmp_Simple1.in
./test/Stress1.exe: .fix-multy2
./test/Stress1.urp: ./Makefile ./lib.urp ./test/Stress1.ur ./test2/Templ.ur .cake3/tmp_Stress1.in
	cat .cake3/tmp_Stress1.in > ./test/Stress1.urp
.cake3/tmp_Stress1.in: ./Makefile
	-rm -rf .cake3/tmp_Stress1.in
	echo 'debug' >> .cake3/tmp_Stress1.in
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp_Stress1.in
	echo 'allow mime text/javascript' >> .cake3/tmp_Stress1.in
	echo 'allow mime text/css' >> .cake3/tmp_Stress1.in
	echo 'allow mime image/jpeg' >> .cake3/tmp_Stress1.in
	echo 'allow mime image/png' >> .cake3/tmp_Stress1.in
	echo 'allow mime image/gif' >> .cake3/tmp_Stress1.in
	echo 'database dbname=Stress1' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/main' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/job_monitor' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/src_monitor' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/job_start' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/finished' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/cleanup' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/monitor' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/run' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/C/callback' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/C/C/callback' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/cnt' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/Find/C/callback' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/Cat/C/callback' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/viewsrc' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/status' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/lastline' >> .cake3/tmp_Stress1.in
	echo 'safeGet Stress1/longrunning' >> .cake3/tmp_Stress1.in
	echo 'sql .././test/Stress1.sql' >> .cake3/tmp_Stress1.in
	echo 'library ../.' >> .cake3/tmp_Stress1.in
	echo '' >> .cake3/tmp_Stress1.in
	echo '$$/list' >> .cake3/tmp_Stress1.in
	echo '$$/string' >> .cake3/tmp_Stress1.in
	echo '.././test2/Templ' >> .cake3/tmp_Stress1.in
	echo '.././test/Stress1' >> .cake3/tmp_Stress1.in
./CallbackFFI.o: ./CallbackFFI.cpp ./Makefile $(call GUARD,URCPP) $(call GUARD,URINCL) $(call GUARD,UR_CFLAGS)
	$(URCPP) -c $(UR_CFLAGS) $(URINCL) -std=c++11 -o ./CallbackFFI.o ./CallbackFFI.cpp
./demo/Demo2.sql: .fix-multy1
./test/Stress1.sql: .fix-multy2
./test2/Notify.sql: .fix-multy3
./test2/Simple1.sql: .fix-multy4
./test2/Stdout.sql: .fix-multy5
./test2/Stress.sql: .fix-multy6
.INTERMEDIATE: .fix-multy1
.fix-multy1: ./Makefile ./demo/Demo2.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./demo/Demo2
.INTERMEDIATE: .fix-multy2
.fix-multy2: ./Makefile ./test/Stress1.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test/Stress1
.INTERMEDIATE: .fix-multy3
.fix-multy3: ./Makefile ./test2/Notify.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Notify
.INTERMEDIATE: .fix-multy4
.fix-multy4: ./Makefile ./test2/Simple1.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Simple1
.INTERMEDIATE: .fix-multy5
.fix-multy5: ./Makefile ./test2/Stdout.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Stdout
.INTERMEDIATE: .fix-multy6
.fix-multy6: ./Makefile ./test2/Stress.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Stress
$(call GUARD,URCPP):
	rm -f .cake3/GUARD_URCPP_*
	touch $@
$(call GUARD,URINCL):
	rm -f .cake3/GUARD_URINCL_*
	touch $@
$(call GUARD,URVERSION):
	rm -f .cake3/GUARD_URVERSION_*
	touch $@
$(call GUARD,UR_CFLAGS):
	rm -f .cake3/GUARD_UR_CFLAGS_*
	touch $@

else

# Prebuild/postbuild section

ifneq ($(MAKECMDGOALS),clean)

.PHONY: all
all: .fix-multy1
.PHONY: ./demo/Demo2.db
./demo/Demo2.db: .fix-multy1
.PHONY: ./test2/Notify.db
./test2/Notify.db: .fix-multy1
.PHONY: ./test2/Stress.db
./test2/Stress.db: .fix-multy1
.PHONY: ./test2/Stdout.db
./test2/Stdout.db: .fix-multy1
.PHONY: ./test2/Simple1.db
./test2/Simple1.db: .fix-multy1
.PHONY: ./test/Stress1.db
./test/Stress1.db: .fix-multy1
.PHONY: lib
lib: .fix-multy1
.PHONY: demo
demo: .fix-multy1
.PHONY: ./demo/Demo2.exe
./demo/Demo2.exe: .fix-multy1
.PHONY: ./demo/Demo2.urp
./demo/Demo2.urp: .fix-multy1
.PHONY: .cake3/tmp_Demo2.in
.cake3/tmp_Demo2.in: .fix-multy1
.PHONY: ./lib.urp
./lib.urp: .fix-multy1
.PHONY: .cake3/tmp_lib.in
.cake3/tmp_lib.in: .fix-multy1
.PHONY: ./test2/Notify.exe
./test2/Notify.exe: .fix-multy1
.PHONY: ./test2/Notify.urp
./test2/Notify.urp: .fix-multy1
.PHONY: .cake3/tmp_Notify.in
.cake3/tmp_Notify.in: .fix-multy1
.PHONY: ./test2/Stress.exe
./test2/Stress.exe: .fix-multy1
.PHONY: ./test2/Stress.urp
./test2/Stress.urp: .fix-multy1
.PHONY: .cake3/tmp_Stress.in
.cake3/tmp_Stress.in: .fix-multy1
.PHONY: ./test2/Stdout.exe
./test2/Stdout.exe: .fix-multy1
.PHONY: ./test2/Stdout.urp
./test2/Stdout.urp: .fix-multy1
.PHONY: .cake3/tmp_Stdout.in
.cake3/tmp_Stdout.in: .fix-multy1
.PHONY: ./test2/Simple1.exe
./test2/Simple1.exe: .fix-multy1
.PHONY: ./test2/Simple1.urp
./test2/Simple1.urp: .fix-multy1
.PHONY: .cake3/tmp_Simple1.in
.cake3/tmp_Simple1.in: .fix-multy1
.PHONY: ./test/Stress1.exe
./test/Stress1.exe: .fix-multy1
.PHONY: ./test/Stress1.urp
./test/Stress1.urp: .fix-multy1
.PHONY: .cake3/tmp_Stress1.in
.cake3/tmp_Stress1.in: .fix-multy1
.PHONY: ./CallbackFFI.o
./CallbackFFI.o: .fix-multy1
.PHONY: ./demo/Demo2.sql
./demo/Demo2.sql: .fix-multy1
.PHONY: ./test/Stress1.sql
./test/Stress1.sql: .fix-multy1
.PHONY: ./test2/Notify.sql
./test2/Notify.sql: .fix-multy1
.PHONY: ./test2/Simple1.sql
./test2/Simple1.sql: .fix-multy1
.PHONY: ./test2/Stdout.sql
./test2/Stdout.sql: .fix-multy1
.PHONY: ./test2/Stress.sql
./test2/Stress.sql: .fix-multy1
.INTERMEDIATE: .fix-multy1
.fix-multy1: 
	-mkdir .cake3
	MAIN=1 $(MAKE) -f ./Makefile $(MAKECMDGOALS)

endif
.PHONY: clean
clean: 
	-rm ./CallbackFFI.o ./demo/Demo2.db ./demo/Demo2.exe ./demo/Demo2.sql ./demo/Demo2.urp ./lib.urp ./test/Stress1.db ./test/Stress1.exe ./test/Stress1.sql ./test/Stress1.urp ./test2/Notify.db ./test2/Notify.exe ./test2/Notify.sql ./test2/Notify.urp ./test2/Simple1.db ./test2/Simple1.exe ./test2/Simple1.sql ./test2/Simple1.urp ./test2/Stdout.db ./test2/Stdout.exe ./test2/Stdout.sql ./test2/Stdout.urp ./test2/Stress.db ./test2/Stress.exe ./test2/Stress.sql ./test2/Stress.urp .cake3/tmp_Demo2.in .cake3/tmp_Notify.in .cake3/tmp_Simple1.in .cake3/tmp_Stdout.in .cake3/tmp_Stress.in .cake3/tmp_Stress1.in .cake3/tmp_lib.in
	-rm -rf .cake3

endif
