From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77102] gallium nouveau has no profile in vdpau and
	libva
Date: Mon, 07 Apr 2014 07:57:22 +0000
Message-ID: <bug-77102-8800-uBJlWsUbQF@http.bugs.freedesktop.org/>
References: <bug-77102-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1269367433=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77102-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1269367433==
Content-Type: multipart/alternative; boundary="1396857441.E8fd60.27197"; charset="us-ascii"


--1396857441.E8fd60.27197
Date: Mon, 7 Apr 2014 07:57:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77102

--- Comment #16 from Stefan Ringel <mail-Omqj8X2OoDOCVLKmEEjRFg@public.gmane.org> ---
(In reply to comment #15)
> Created attachment 97014 [details]
> correct profile in vdpauinfo + vainfo

dmseg:
[   97.292274] nouveau T[    PBSP][0000:01:00.0] inc() == 4
[   97.341821] nouveau T[    PBSP][0000:01:00.0] use(+1) == 1
[   97.341827] nouveau T[    PBSP][0000:01:00.0] initialising...
[   97.341831] nouveau T[    PBSP][0000:01:00.0] resetting...
[   97.341840] nouveau D[    PBSP][0000:01:00.0] reset
[   97.341847] nouveau D[    PBSP][0000:01:00.0] falcon version: 4
[   97.341850] nouveau D[    PBSP][0000:01:00.0] secret level: 3
[   97.341852] nouveau D[    PBSP][0000:01:00.0] code limit: 8192
[   97.341855] nouveau D[    PBSP][0000:01:00.0] data limit: 4096
[   97.376514] nouveau D[    PBSP][0000:01:00.0] firmware: nouveau/nvd9_fuc084
(self-bootstrapping)
[   97.377803] nouveau D[    PBSP][0000:01:00.0] initialised
[   97.377983] nouveau T[    PBSP][0000:01:00.0] inc() == 5
[   97.378050] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
created
[   97.378057] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
inc() == 2
[   97.378062] nouveau T[    PBSP][0000:01:00.0] inc() == 6
[   97.378068] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
created
[   97.378074] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(+1) == 1
[   97.378080] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
initialising...
[   97.378086] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
use(+1) == 1
[   97.378092] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
initialising...
[   97.378104] nouveau T[    PBSP][0000:01:00.0] use(+1) == 2
[   97.378145] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
initialised
[   97.378150] nouveau T[    PBSP][0000:01:00.0] use(+1) == 3
[   97.378156] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
initialised
[   97.378163] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
inc() == 2
[   97.378170] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(+1) == 2
[   97.378177] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(-1) == 1
[   97.378183] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
dec() == 1
[   97.378189] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
dec() == 1
[   97.378194] nouveau T[    PBSP][0000:01:00.0] use(-1) == 2
[   97.379223] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(-1) == 0
[   97.379229] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
stopping...
[   97.379943] nouveau T[    PBSP][0000:01:00.0] use(-1) == 1
[   97.379945] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
use(-1) == 0
[   97.379948] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
stopping...
[   97.379957] nouveau T[    PBSP][0000:01:00.0] use(-1) == 0
[   97.379959] nouveau T[    PBSP][0000:01:00.0] stopping...
[   97.379991] nouveau D[    PBSP][0000:01:00.0] stopped
[   97.379996] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
stopped
[   97.379998] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
stopped
[   97.380001] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
dec() == 0
[   97.380004] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
destroying
[   97.380006] nouveau T[    PBSP][0000:01:00.0] dec() == 5
[   97.380008] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
dec() == 0
[   97.380011] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
destroying
[   97.380040] nouveau T[    PBSP][0000:01:00.0] dec() == 4
[   97.509998] nouveau T[    PBSP][0000:01:00.0] dec() == 3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396857441.E8fd60.27197
Date: Mon, 7 Apr 2014 07:57:21 +0000
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
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102">bug 77102</a>
              from <span class="vcard"><a class="email" href="mailto:mail&#64;stefanringel.de" title="Stefan Ringel &lt;mail&#64;stefanringel.de&gt;"> <span class="fn">Stefan Ringel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77102#c15">comment #15</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=97014" name="attach_97014" title="correct profile in vdpauinfo + vainfo">attachment 97014</a> <a href="attachment.cgi?id=97014&amp;action=edit" title="correct profile in vdpauinfo + vainfo">[details]</a></span>
&gt; correct profile in vdpauinfo + vainfo</span >

dmseg:
[   97.292274] nouveau T[    PBSP][0000:01:00.0] inc() == 4
[   97.341821] nouveau T[    PBSP][0000:01:00.0] use(+1) == 1
[   97.341827] nouveau T[    PBSP][0000:01:00.0] initialising...
[   97.341831] nouveau T[    PBSP][0000:01:00.0] resetting...
[   97.341840] nouveau D[    PBSP][0000:01:00.0] reset
[   97.341847] nouveau D[    PBSP][0000:01:00.0] falcon version: 4
[   97.341850] nouveau D[    PBSP][0000:01:00.0] secret level: 3
[   97.341852] nouveau D[    PBSP][0000:01:00.0] code limit: 8192
[   97.341855] nouveau D[    PBSP][0000:01:00.0] data limit: 4096
[   97.376514] nouveau D[    PBSP][0000:01:00.0] firmware: nouveau/nvd9_fuc084
(self-bootstrapping)
[   97.377803] nouveau D[    PBSP][0000:01:00.0] initialised
[   97.377983] nouveau T[    PBSP][0000:01:00.0] inc() == 5
[   97.378050] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
created
[   97.378057] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
inc() == 2
[   97.378062] nouveau T[    PBSP][0000:01:00.0] inc() == 6
[   97.378068] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
created
[   97.378074] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(+1) == 1
[   97.378080] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
initialising...
[   97.378086] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
use(+1) == 1
[   97.378092] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
initialising...
[   97.378104] nouveau T[    PBSP][0000:01:00.0] use(+1) == 2
[   97.378145] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
initialised
[   97.378150] nouveau T[    PBSP][0000:01:00.0] use(+1) == 3
[   97.378156] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
initialised
[   97.378163] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
inc() == 2
[   97.378170] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(+1) == 2
[   97.378177] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(-1) == 1
[   97.378183] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
dec() == 1
[   97.378189] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
dec() == 1
[   97.378194] nouveau T[    PBSP][0000:01:00.0] use(-1) == 2
[   97.379223] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
use(-1) == 0
[   97.379229] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
stopping...
[   97.379943] nouveau T[    PBSP][0000:01:00.0] use(-1) == 1
[   97.379945] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
use(-1) == 0
[   97.379948] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
stopping...
[   97.379957] nouveau T[    PBSP][0000:01:00.0] use(-1) == 0
[   97.379959] nouveau T[    PBSP][0000:01:00.0] stopping...
[   97.379991] nouveau D[    PBSP][0000:01:00.0] stopped
[   97.379996] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
stopped
[   97.379998] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
stopped
[   97.380001] nouveau T[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
dec() == 0
[   97.380004] nouveau D[    PBSP][0000:01:00.0][0x000090b1][ffff8800c2bfc960]
destroying
[   97.380006] nouveau T[    PBSP][0000:01:00.0] dec() == 5
[   97.380008] nouveau T[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
dec() == 0
[   97.380011] nouveau D[    PBSP][0000:01:00.0][0x0300c01b][ffff880118ebf800]
destroying
[   97.380040] nouveau T[    PBSP][0000:01:00.0] dec() == 4
[   97.509998] nouveau T[    PBSP][0000:01:00.0] dec() == 3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396857441.E8fd60.27197--

--===============1269367433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1269367433==--
