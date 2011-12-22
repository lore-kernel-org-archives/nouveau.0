From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 44061] New: dri/nouveau: Build error with clang
Date: Thu, 22 Dec 2011 15:49:27 +0000
Message-ID: <bug-44061-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=44061

             Bug #: 44061
           Summary: dri/nouveau: Build error with clang
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: All
               URL: http://lists.freedesktop.org/archives/mesa-dev/2011-No
                    vember/014310.html
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org
                CC: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org


nouveau_array.c:49:16: error: illegal storage class on function
                *extract_u = EXTRACT(char, unsigned, 1);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:49:16: error: expected ';' at end of declaration
                *extract_u = EXTRACT(char, unsigned, 1);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:50:16: error: illegal storage class on function
                *extract_f = EXTRACT(char, float, SCHAR_MAX);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:50:16: error: expected ';' at end of declaration
                *extract_f = EXTRACT(char, float, SCHAR_MAX);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:53:16: error: illegal storage class on function
                *extract_u = EXTRACT(unsigned char, unsigned, 1);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:53:16: error: expected ';' at end of declaration
                *extract_u = EXTRACT(unsigned char, unsigned, 1);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:54:16: error: illegal storage class on function
                *extract_f = EXTRACT(unsigned char, float, UCHAR_MAX);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:54:16: error: expected ';' at end of declaration
                *extract_f = EXTRACT(unsigned char, float, UCHAR_MAX);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:57:16: error: illegal storage class on function
                *extract_u = EXTRACT(short, unsigned, 1);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:57:16: error: expected ';' at end of declaration
                *extract_u = EXTRACT(short, unsigned, 1);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:58:16: error: illegal storage class on function
                *extract_f = EXTRACT(short, float, SHRT_MAX);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:58:16: error: expected ';' at end of declaration
                *extract_f = EXTRACT(short, float, SHRT_MAX);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:61:16: error: illegal storage class on function
                *extract_u = EXTRACT(unsigned short, unsigned, 1);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:61:16: error: expected ';' at end of declaration
                *extract_u = EXTRACT(unsigned short, unsigned, 1);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:62:16: error: illegal storage class on function
                *extract_f = EXTRACT(unsigned short, float, USHRT_MAX);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:62:16: error: expected ';' at end of declaration
                *extract_f = EXTRACT(unsigned short, float, USHRT_MAX);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:65:16: error: illegal storage class on function
                *extract_u = EXTRACT(int, unsigned, 1);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
nouveau_array.c:65:16: error: expected ';' at end of declaration
                *extract_u = EXTRACT(int, unsigned, 1);
                             ^
nouveau_array.c:39:50: note: expanded from macro 'EXTRACT'
                out_t f(struct nouveau_array *a, int i, int j) {        \
                                                               ^
nouveau_array.c:66:16: error: illegal storage class on function
                *extract_f = EXTRACT(int, float, INT_MAX);
                             ^
nouveau_array.c:38:3: note: expanded from macro 'EXTRACT'
                auto out_t f(struct nouveau_array *, int, int);         \
                ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
gmake[6]: *** [nouveau_array.o] Error 1
gmake[6]: *** Waiting for unfinished jobs....
nouveau_context.c:267:2: warning: expression result unused [-Wunused-value]
        context_bctx(ctx, FRAMEBUFFER);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./nouveau_bo_state.h:103:2: note: expanded from macro 'context_bctx'
        __context_bctx(ctx, NOUVEAU_BO_CONTEXT_##s)
        ^
./nouveau_bo_state.h:100:3: note: expanded from macro '__context_bctx'
                bctx;                                                   \
                ^~~~
1 warning generated.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
