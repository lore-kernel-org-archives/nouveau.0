From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Sat, 09 Nov 2013 20:34:35 +0000
Message-ID: <bug-69928-8800-LSp2pTwMHq@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811360414=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0811360414==
Content-Type: multipart/alternative; boundary="1384029275.A0102.573"; charset="us-ascii"


--1384029275.A0102.573
Date: Sat, 9 Nov 2013 20:34:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
FTR, the trace contains:

[1] 698.683063 MMIO32 R 0x088068 0x00810005 PPCI.MSI_HEAD => { CAP_ID = MSI |
NEXT_CAP_PTR = 0 | ENABLE | QMASK = 0 | QSIZE = 0 | 64BIT }
[1] 698.683072 MMIO8 W 0x088068 0x000000ff PPCI.MSI_HEAD <= { CAP_ID = 0xff |
NEXT_CAP_PTR = 0 | QMASK = 0 | QSIZE = 0 }

and then later

[1] 699.766366 MMIO32 R 0x000100 0x80000000 PMC.INTR_HOST => { SOFTWARE }
[1] 699.766375 MMIO32 W 0x000100 0x00000000 PMC.INTR_HOST <= { 0 }
[1] 699.766434 MMIO8 W 0x088068 0x000000ff PPCI.MSI_HEAD <= { CAP_ID = 0xff |
NEXT_CAP_PTR = 0 | QMASK = 0 | QSIZE = 0 }
[1] 699.766443 MMIO32 W 0x000140 0x00000000 PMC.INTR_EN_HOST <= { 0 }

etc. So the blob does enable MSI on NVAA.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384029275.A0102.573
Date: Sat, 9 Nov 2013 20:34:35 +0000
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
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FTR, the trace contains:

[1] 698.683063 MMIO32 R 0x088068 0x00810005 PPCI.MSI_HEAD =&gt; { CAP_ID = MSI |
NEXT_CAP_PTR = 0 | ENABLE | QMASK = 0 | QSIZE = 0 | 64BIT }
[1] 698.683072 MMIO8 W 0x088068 0x000000ff PPCI.MSI_HEAD &lt;= { CAP_ID = 0xff |
NEXT_CAP_PTR = 0 | QMASK = 0 | QSIZE = 0 }

and then later

[1] 699.766366 MMIO32 R 0x000100 0x80000000 PMC.INTR_HOST =&gt; { SOFTWARE }
[1] 699.766375 MMIO32 W 0x000100 0x00000000 PMC.INTR_HOST &lt;= { 0 }
[1] 699.766434 MMIO8 W 0x088068 0x000000ff PPCI.MSI_HEAD &lt;= { CAP_ID = 0xff |
NEXT_CAP_PTR = 0 | QMASK = 0 | QSIZE = 0 }
[1] 699.766443 MMIO32 W 0x000140 0x00000000 PMC.INTR_EN_HOST &lt;= { 0 }

etc. So the blob does enable MSI on NVAA.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384029275.A0102.573--

--===============0811360414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811360414==--
