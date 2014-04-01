From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76818] [NVE7] GPU lockup
Date: Tue, 01 Apr 2014 02:51:25 +0000
Message-ID: <bug-76818-8800-gBrygBOBET@http.bugs.freedesktop.org/>
References: <bug-76818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1766137563=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76818-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1766137563==
Content-Type: multipart/alternative; boundary="1396320685.58a8CA2.18898"; charset="us-ascii"


--1396320685.58a8CA2.18898
Date: Tue, 1 Apr 2014 02:51:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76818

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Xorg EQ overflowing lock up |[NVE7] GPU lockup

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It's more common to attach logs... otherwise the bug reports become very
unwieldy to read.

[ 1743.737807] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
[ 8543.865800] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 8558.870800] nouveau E[  X[808]] failed to idle channel 0xcccc0001 [X[808]]

The unhandled PFIFO bit comes _way_ earlier than the gpu lockup... so probably
unrelated.

The fact that X segfaults when the GPU locks up is a little unfortunate, but
right now this situation is completely unhandled by the userspace stack in any
case. Ideally the GPU wouldn't lock up :)

A quick and easy thing to try is blob pgraph firmware instead of nouveau's.
Take a look at http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware
for a quick and easy way to get it (yes, I know it says it's for hw video
decoding accel, but the script extracts all fw). Follow those instructions and
add

nouveau.config=NvGrUseFw=1

to the kernel command line (or when loading the nouveau module); make sure that
the firmware files are available when the nouveau module loads (so if it loads
from your initrd, they need to be in your initrd).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396320685.58a8CA2.18898
Date: Tue, 1 Apr 2014 02:51:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">bug 76818</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Xorg EQ overflowing lock up
           </td>
           <td>[NVE7] GPU lockup
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">bug 76818</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It's more common to attach logs... otherwise the bug reports become very
unwieldy to read.

[ 1743.737807] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000
[ 8543.865800] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 8558.870800] nouveau E[  X[808]] failed to idle channel 0xcccc0001 [X[808]]

The unhandled PFIFO bit comes _way_ earlier than the gpu lockup... so probably
unrelated.

The fact that X segfaults when the GPU locks up is a little unfortunate, but
right now this situation is completely unhandled by the userspace stack in any
case. Ideally the GPU wouldn't lock up :)

A quick and easy thing to try is blob pgraph firmware instead of nouveau's.
Take a look at <a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware</a>
for a quick and easy way to get it (yes, I know it says it's for hw video
decoding accel, but the script extracts all fw). Follow those instructions and
add

nouveau.config=NvGrUseFw=1

to the kernel command line (or when loading the nouveau module); make sure that
the firmware files are available when the nouveau module loads (so if it loads
from your initrd, they need to be in your initrd).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396320685.58a8CA2.18898--

--===============1766137563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1766137563==--
