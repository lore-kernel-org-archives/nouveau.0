From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Wed, 21 Aug 2013 02:26:29 +0000
Message-ID: <bug-60772-8800-Yh8Gd4C9cP@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1916475832=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1916475832==
Content-Type: multipart/alternative; boundary="1377051989.bABBdB81.9352"; charset="us-ascii"


--1377051989.bABBdB81.9352
Date: Wed, 21 Aug 2013 02:26:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The usual mechanism, nowadays, for modules to load is that the kernel creates
some stuff in /sys, udev is notified about it, looks at the module_alias which
describe what it is that the modules claim they support, and loads the right
ones. In this case the nouveau module should (and does) claim to support some
set of pci devices. (I might have that a little wrong, but that's the overall
gist.) If you're not using udev/have disabled that somehow, I don't think it's
too much to ask you to load the module yourself.

In any case, I don't think having this in the bugtracker will lead to the
resolution that you're seeking. If you really want to change the behaviour,
send a patch, ping people, etc. It sounds like the various people are in favor
of the current behaviour (I know I am -- I hate it when things do stuff behind
my back). For anyone looking at this later, see discussion that followed
http://lists.freedesktop.org/archives/nouveau/2013-February/012222.html .

If you want to boot s.t. you can load the nvidia driver, you can either boot
with nouveau.modeset=0, or take a look at
http://nouveau.freedesktop.org/wiki/KernelModeSetting/ for how to unload a
"mode-setted" module.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377051989.bABBdB81.9352
Date: Wed, 21 Aug 2013 02:26:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WONTFIX
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The usual mechanism, nowadays, for modules to load is that the kernel creates
some stuff in /sys, udev is notified about it, looks at the module_alias which
describe what it is that the modules claim they support, and loads the right
ones. In this case the nouveau module should (and does) claim to support some
set of pci devices. (I might have that a little wrong, but that's the overall
gist.) If you're not using udev/have disabled that somehow, I don't think it's
too much to ask you to load the module yourself.

In any case, I don't think having this in the bugtracker will lead to the
resolution that you're seeking. If you really want to change the behaviour,
send a patch, ping people, etc. It sounds like the various people are in favor
of the current behaviour (I know I am -- I hate it when things do stuff behind
my back). For anyone looking at this later, see discussion that followed
<a href="http://lists.freedesktop.org/archives/nouveau/2013-February/012222.html">http://lists.freedesktop.org/archives/nouveau/2013-February/012222.html</a> .

If you want to boot s.t. you can load the nvidia driver, you can either boot
with nouveau.modeset=0, or take a look at
<a href="http://nouveau.freedesktop.org/wiki/KernelModeSetting/">http://nouveau.freedesktop.org/wiki/KernelModeSetting/</a> for how to unload a
&quot;mode-setted&quot; module.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377051989.bABBdB81.9352--

--===============1916475832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1916475832==--
