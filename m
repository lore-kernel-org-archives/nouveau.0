From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90424] [NVAA] Xorg on HDMI regression since v4.0-rc1
Date: Tue, 12 May 2015 18:48:59 +0000
Message-ID: <bug-90424-8800-jMDwVD6tI4@http.bugs.freedesktop.org/>
References: <bug-90424-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0596200407=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90424-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0596200407==
Content-Type: multipart/alternative; boundary="1431456539.0EC7fD81.464"; charset="UTF-8"


--1431456539.0EC7fD81.464
Date: Tue, 12 May 2015 18:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90424

Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #4 from Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org> ---
Apparently this is due a custom modesetting I needed to use before attaching a
AV receiver. My TV required a custom modesetting with resolution 1360x768, but
this is not supported by the AV receiver. So when using the unsupported
resolution with panel scaling nothing is displayed.
In my case I could remove the custom modesetting as the AV receiver has a
proper EDID with 1920x1080 (which is scaled down by that box for the TV). If
someone needs a custom modesetting the old fullscreen scaling should be used,
e.g. 
xrandr --output HDMI-1 --prop 'scaling mode' 'Full'

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431456539.0EC7fD81.464
Date: Tue, 12 May 2015 18:48:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:alexanders83&#64;web.de" title="Alexander Stein &lt;alexanders83&#64;web.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NVAA] Xorg on HDMI regression since v4.0-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90424">bug 90424</a>
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
           <td>INVALID
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NVAA] Xorg on HDMI regression since v4.0-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90424#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - [NVAA] Xorg on HDMI regression since v4.0-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90424">bug 90424</a>
              from <span class="vcard"><a class="email" href="mailto:alexanders83&#64;web.de" title="Alexander Stein &lt;alexanders83&#64;web.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span></b>
        <pre>Apparently this is due a custom modesetting I needed to use before attaching a
AV receiver. My TV required a custom modesetting with resolution 1360x768, but
this is not supported by the AV receiver. So when using the unsupported
resolution with panel scaling nothing is displayed.
In my case I could remove the custom modesetting as the AV receiver has a
proper EDID with 1920x1080 (which is scaled down by that box for the TV). If
someone needs a custom modesetting the old fullscreen scaling should be used,
e.g. 
xrandr --output HDMI-1 --prop 'scaling mode' 'Full'</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431456539.0EC7fD81.464--

--===============0596200407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0596200407==--
