From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Sun, 25 Aug 2013 15:09:36 +0000
Message-ID: <bug-20341-8800-UkBNe5Dt8w@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638768234=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1638768234==
Content-Type: multipart/alternative; boundary="1377443375.38281.15917"; charset="us-ascii"


--1377443375.38281.15917
Date: Sun, 25 Aug 2013 15:09:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #21 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
Hi,

I believe VIA Technologies KT133's AGP may be the culprit.

http://us.download.nvidia.com/XFree86/Linux-x86/173.14.09/README/chapter-12.html

KT133's (VT8363) AGP is likely to be generationally be closer to Apollo Pro133A
(VT82C694X) and KX133 (VT8371).
KT133 and KX133 are fairly similar with KT133 correctly supporting AMD Socket
A.
KX133 supposedly did not implement a certain type of I/O buffer for EV6 bus to
support Socket A, and as a result, it will not be able to support Socket A.
Of course, that issue is not related to AGP, but since KT133 came out fairly
quickly after the EV6 bus issue was acknowledged, it is probably a minor
updated version of KX133.
Nouveau may have to add special code to detect the chipset, and if it detects
certain known VIA Technologies chipsets, it should turn off AGP 4X mode (i.e.,
run at 2X mode).
I do not know if VIA Technologies really fixed the AGP for these chipsets, or
perhaps they fixed it with their newer chipsets.
I hope this information adds to the discussion.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377443375.38281.15917
Date: Sun, 25 Aug 2013 15:09:35 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>Hi,

I believe VIA Technologies KT133's AGP may be the culprit.

<a href="http://us.download.nvidia.com/XFree86/Linux-x86/173.14.09/README/chapter-12.html">http://us.download.nvidia.com/XFree86/Linux-x86/173.14.09/README/chapter-12.html</a>

KT133's (VT8363) AGP is likely to be generationally be closer to Apollo Pro133A
(VT82C694X) and KX133 (VT8371).
KT133 and KX133 are fairly similar with KT133 correctly supporting AMD Socket
A.
KX133 supposedly did not implement a certain type of I/O buffer for EV6 bus to
support Socket A, and as a result, it will not be able to support Socket A.
Of course, that issue is not related to AGP, but since KT133 came out fairly
quickly after the EV6 bus issue was acknowledged, it is probably a minor
updated version of KX133.
Nouveau may have to add special code to detect the chipset, and if it detects
certain known VIA Technologies chipsets, it should turn off AGP 4X mode (i.e.,
run at 2X mode).
I do not know if VIA Technologies really fixed the AGP for these chipsets, or
perhaps they fixed it with their newer chipsets.
I hope this information adds to the discussion.

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377443375.38281.15917--

--===============1638768234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1638768234==--
