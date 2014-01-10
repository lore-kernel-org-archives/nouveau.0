From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 10 Jan 2014 19:27:25 +0000
Message-ID: <bug-73358-8800-wFTb0ugtEb@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1418089956=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1418089956==
Content-Type: multipart/alternative; boundary="1389382045.7a13aC1.31804"; charset="us-ascii"


--1389382045.7a13aC1.31804
Date: Fri, 10 Jan 2014 19:27:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #8 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yelled too soon. The latest flash for this CPU (non SSE2) for google chrome
(11.2.202.235) (I think) gives this:

[ 7036.622880] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 7036.622912] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.622975] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.622987] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0204 data 0x00b80000
[ 7036.623357] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623372] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.623485] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623497] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.623969] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623981] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.624097] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.624108] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.173857] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.173889] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174067] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174081] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174129] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174140] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174359] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174373] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174421] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174433] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.461416] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.461448] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.461894] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.461908] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462023] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462035] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462511] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462525] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462638] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462651] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389382045.7a13aC1.31804
Date: Fri, 10 Jan 2014 19:27:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Yelled too soon. The latest flash for this CPU (non SSE2) for google chrome
(11.2.202.235) (I think) gives this:

[ 7036.622880] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 7036.622912] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.622975] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.622987] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0204 data 0x00b80000
[ 7036.623357] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623372] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.623485] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623497] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.623969] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.623981] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7036.624097] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7036.624108] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.173857] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.173889] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174067] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174081] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174129] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174140] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174359] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174373] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7049.174421] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7049.174433] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.461416] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.461448] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.461894] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.461908] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462023] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462035] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462511] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462525] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120
[ 7052.462638] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT PROTECTION_FAULT
[ 7052.462651] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[5871]] subc 7
class 0x0697 mthd 0x0208 data 0x00000120</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389382045.7a13aC1.31804--

--===============1418089956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1418089956==--
