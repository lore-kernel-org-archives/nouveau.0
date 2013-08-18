From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51291] Segfault with mplayer -vo vdpau:
 vlVdpVideoSurfaceClear at surface.c:366
Date: Sun, 18 Aug 2013 19:08:06 +0000
Message-ID: <bug-51291-8800-HeWTykgs0J@http.bugs.freedesktop.org/>
References: <bug-51291-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1159458695=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51291-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1159458695==
Content-Type: multipart/alternative; boundary="1376852886.522Baf61.22113"; charset="us-ascii"


--1376852886.522Baf61.22113
Date: Sun, 18 Aug 2013 19:08:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51291

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There's a good chance that this is fixed with:

http://cgit.freedesktop.org/mesa/mesa/commit/?id=8975f83402e3f5915f3f1a27599c24d908b7706d

Of course note that vdpau still won't work for pre-nv84 cards, but it shouldn't
crash quite like this. (It'll probably crash in a different way, as
decode_bitstream isn't set. I did try to get it to work, but in the end, the
actual decoding didn't work correctly.) More information on what ought to work
is at http://nouveau.freedesktop.org/wiki/VideoAcceleration/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376852886.522Baf61.22113
Date: Sun, 18 Aug 2013 19:08:06 +0000
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
   title="RESOLVED FIXED - Segfault with mplayer -vo vdpau: vlVdpVideoSurfaceClear at surface.c:366"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51291">bug 51291</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Segfault with mplayer -vo vdpau: vlVdpVideoSurfaceClear at surface.c:366"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51291#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Segfault with mplayer -vo vdpau: vlVdpVideoSurfaceClear at surface.c:366"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51291">bug 51291</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There's a good chance that this is fixed with:

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=8975f83402e3f5915f3f1a27599c24d908b7706d">http://cgit.freedesktop.org/mesa/mesa/commit/?id=8975f83402e3f5915f3f1a27599c24d908b7706d</a>

Of course note that vdpau still won't work for pre-nv84 cards, but it shouldn't
crash quite like this. (It'll probably crash in a different way, as
decode_bitstream isn't set. I did try to get it to work, but in the end, the
actual decoding didn't work correctly.) More information on what ought to work
is at <a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376852886.522Baf61.22113--

--===============1159458695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1159458695==--
