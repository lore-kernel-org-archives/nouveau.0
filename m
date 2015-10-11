From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] GL Excess demo renders incorrectly on nv43
Date: Sun, 11 Oct 2015 06:41:29 +0000
Message-ID: <bug-92306-8800-bmJiFNO64M@http.bugs.freedesktop.org/>
References: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1134939926=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1134939926==
Content-Type: multipart/alternative; boundary="1444545689.e31180.27062"; charset="UTF-8"


--1444545689.e31180.27062
Date: Sun, 11 Oct 2015 06:41:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

--- Comment #11 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
After recompiling mesa

mesa git  commit 93161be9e7150ae5931000627833e714901cf195 -  "i965: Fix
intel_miptree_is_fast_clear_capable()"

with this command line 
 ./configure --prefix=/usr --disable-dri3 --with-gallium-drivers=nouveau
--enable-texture-float --enable-debug --with-dri-drivers=swrast

I got in terminal
----------
bash-4.2$ wine GLExcess.exe 
fixme:winediag:start_process Wine Staging 1.7.51 is a testing version
containing experimental patches.
fixme:winediag:start_process Please report bugs at http://bugs.wine-staging.com
(instead of winehq.org).
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: Fontconfig
warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading configurations from
~/.fonts.conf is deprecated.
reading configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
bash-4.2$ Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14:
reading configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Mismatched color and zeta formats, ignoring zeta.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: "/etc/fonts/conf.d/50-user.conf", line 14: reading
configurations from ~/.fonts.conf is deprecated.
kbuildsycoca running...
--------

important part seems to be:
"Mismatched color and zeta formats, ignoring zeta."

I also tried to disable PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT , but this not
fixed my bug.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444545689.e31180.27062
Date: Sun, 11 Oct 2015 06:41:29 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">bug 92306</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>After recompiling mesa

mesa git  commit 93161be9e7150ae5931000627833e714901cf195 -  &quot;i965: Fix
intel_miptree_is_fast_clear_capable()&quot;

with this command line 
 ./configure --prefix=/usr --disable-dri3 --with-gallium-drivers=nouveau
--enable-texture-float --enable-debug --with-dri-drivers=swrast

I got in terminal
----------
bash-4.2$ wine GLExcess.exe 
fixme:winediag:start_process Wine Staging 1.7.51 is a testing version
containing experimental patches.
fixme:winediag:start_process Please report bugs at <a href="http://bugs.wine-staging.com">http://bugs.wine-staging.com</a>
(instead of winehq.org).
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: Fontconfig
warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading configurations from
~/.fonts.conf is deprecated.
reading configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
fixme:ole:RemUnknown_QueryInterface No interface for iid
{00000019-0000-0000-c000-000000000046}
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
bash-4.2$ Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14:
reading configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Mismatched color and zeta formats, ignoring zeta.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
Fontconfig warning: &quot;/etc/fonts/conf.d/50-user.conf&quot;, line 14: reading
configurations from ~/.fonts.conf is deprecated.
kbuildsycoca running...
--------

important part seems to be:
&quot;Mismatched color and zeta formats, ignoring zeta.&quot;

I also tried to disable PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT , but this not
fixed my bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444545689.e31180.27062--

--===============1134939926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1134939926==--
