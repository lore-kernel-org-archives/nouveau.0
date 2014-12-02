From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86935] [NV106] unknown kepler chipset 0x106
Date: Tue, 02 Dec 2014 16:25:53 +0000
Message-ID: <bug-86935-8800-vGhPY80OqJ@http.bugs.freedesktop.org/>
References: <bug-86935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1033814977=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86935-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1033814977==
Content-Type: multipart/alternative; boundary="1417537553.fE06b62a1.30637"; charset="UTF-8"


--1417537553.fE06b62a1.30637
Date: Tue, 2 Dec 2014 16:25:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86935

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Sven from comment #5)
> I will try to do the mmiotrace of the blob. Problem is, that the binary
> nvidia drivers gives me a kernel OOPS. Yay!

D'oh! Maybe try a newer driver? If it oopses "later" rather than on load/X
start, then that should be enough for a mmiotrace.

> 
> Also, while I can make the changes to the kernel source, I'm not really sure
> what you're asking from me regarding the git format-patch. I'm not really an
> experienced git user yet.

Step 1: get a git checkout
Step 2: Make changes
Step 3: git commit -a [pops up editor window, enter in a commit log, subject on
first line, blank line, then longer description as necessary, and your sign
off]
Step 4: git format-patch HEAD^..
Step 5: review the foo.patch file that's generated
Step 6: git send-email --to 'nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org' foo.patch [or send
it as an email in some other way, just make sure that way preserves little
details like tabs]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417537553.fE06b62a1.30637
Date: Tue, 2 Dec 2014 16:25:53 +0000
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
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV106] unknown kepler chipset 0x106"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86935">bug 86935</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Sven from <a href="show_bug.cgi?id=86935#c5">comment #5</a>)
<span class="quote">&gt; I will try to do the mmiotrace of the blob. Problem is, that the binary
&gt; nvidia drivers gives me a kernel OOPS. Yay!</span >

D'oh! Maybe try a newer driver? If it oopses &quot;later&quot; rather than on load/X
start, then that should be enough for a mmiotrace.

<span class="quote">&gt; 
&gt; Also, while I can make the changes to the kernel source, I'm not really sure
&gt; what you're asking from me regarding the git format-patch. I'm not really an
&gt; experienced git user yet.</span >

Step 1: get a git checkout
Step 2: Make changes
Step 3: git commit -a [pops up editor window, enter in a commit log, subject on
first line, blank line, then longer description as necessary, and your sign
off]
Step 4: git format-patch HEAD^..
Step 5: review the foo.patch file that's generated
Step 6: git send-email --to '<a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a>' foo.patch [or send
it as an email in some other way, just make sure that way preserves little
details like tabs]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417537553.fE06b62a1.30637--

--===============1033814977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1033814977==--
