From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [NV34] libdrm built with gcc4.8 causes
	crashes/lockups
Date: Thu, 07 Nov 2013 09:58:44 +0000
Message-ID: <bug-71116-8800-pqP0YGZuID@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0284742474=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0284742474==
Content-Type: multipart/alternative; boundary="1383818323.d2822.2041"; charset="us-ascii"


--1383818323.d2822.2041
Date: Thu, 7 Nov 2013 09:58:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #18 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
Wow this is definitely a weird interesting bug.

It affects suspend-to-mem on my pci-e nv43 too.

<after resume from suspend to memory>
[   40.107810] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[   40.108059] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x000f7000 compiz[1713]]
subc 2 class 0x0039 mthd 0x0314 data 0x0051f000
(error repeats)

I can confirm that rebuilding only libdrm-nouveau2 with the raring toolchain
fixes it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383818323.d2822.2041
Date: Thu, 7 Nov 2013 09:58:43 +0000
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
   title="NEW --- - [NV34] libdrm built with gcc4.8 causes crashes/lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] libdrm built with gcc4.8 causes crashes/lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Wow this is definitely a weird interesting bug.

It affects suspend-to-mem on my pci-e nv43 too.

&lt;after resume from suspend to memory&gt;
[   40.107810] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[   40.108059] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x000f7000 compiz[1713]]
subc 2 class 0x0039 mthd 0x0314 data 0x0051f000
(error repeats)

I can confirm that rebuilding only libdrm-nouveau2 with the raring toolchain
fixes it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383818323.d2822.2041--

--===============0284742474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0284742474==--
