From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Sat, 11 Jan 2014 15:57:12 +0000
Message-ID: <bug-73358-8800-ArpJPayNLB@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374185514=="
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


--===============1374185514==
Content-Type: multipart/alternative; boundary="1389455832.fcABc5f1.16855"; charset="us-ascii"


--1389455832.fcABc5f1.16855
Date: Sat, 11 Jan 2014 15:57:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #15 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I got somewhat the same errors with supertuxkart (don't ask).

3,1775,10645808600,-;nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
3,1776,10645808638,-;nouveau E[  PGRAPH][0000:01:00.0] ch 3
[supertuxkart[9875]] subc 7 class 0x0697 mthd 0x0208 data 0x02000248
3,1777,10645813906,-;nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
3,1778,10645813938,-;nouveau E[  PGRAPH][0000:01:00.0] ch 3
[supertuxkart[9875]] subc 7 class 0x0697 mthd 0x0208 data 0x02000248

Closed the window as soon as the errors appear. Yet the uncompressed trace is
30MB. Hope this helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389455832.fcABc5f1.16855
Date: Sat, 11 Jan 2014 15:57:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>I got somewhat the same errors with supertuxkart (don't ask).

3,1775,10645808600,-;nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
3,1776,10645808638,-;nouveau E[  PGRAPH][0000:01:00.0] ch 3
[supertuxkart[9875]] subc 7 class 0x0697 mthd 0x0208 data 0x02000248
3,1777,10645813906,-;nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
3,1778,10645813938,-;nouveau E[  PGRAPH][0000:01:00.0] ch 3
[supertuxkart[9875]] subc 7 class 0x0697 mthd 0x0208 data 0x02000248

Closed the window as soon as the errors appear. Yet the uncompressed trace is
30MB. Hope this helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389455832.fcABc5f1.16855--

--===============1374185514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1374185514==--
