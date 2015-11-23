From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Mon, 23 Nov 2015 17:58:03 +0000
Message-ID: <bug-92991-8800-GOjZk7N8cO@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0028819577=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0028819577==
Content-Type: multipart/alternative; boundary="1448301483.abEFb0BE1.27062"; charset="UTF-8"


--1448301483.abEFb0BE1.27062
Date: Mon, 23 Nov 2015 17:58:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Oliver Neukum from comment #8)
> With runpm=0 I get full output of xrandr. Without it, it is an instant crash:
> 
> Screen 0: minimum 8 x 8, current 1600 x 900, maximum 32767 x 32767
> eDP1 connected primary 1600x900+0+0 (normal left inverted right x axis y
> axis) 382mm x 215mm
>    1600x900      60.01*+  40.00  
>    1024x768      60.00  
>    800x600       60.32    56.25  
>    640x480       59.94  
> VGA1 disconnected (normal left inverted right x axis y axis)
> VIRTUAL1 disconnected (normal left inverted right x axis y axis)
> DisplayPort-1-0 disconnected (normal left inverted right x axis y axis)
> DisplayPort-1-1 disconnected (normal left inverted right x axis y axis)
> DisplayPort-1-2 connected (normal left inverted right x axis y axis)
>    1680x1050     59.88 +  59.95  

Those connector names look like they're from xf86-video-modesetting, not
xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
version of xf86-video-intel are you using? SNA or UXA?

I definitely know that earlier modesetting various had various issues with
reverse prime... when you say "lockup", do you really mean "lockup", or "system
working perfectly fine with the minor exception that the display stops
updating"?

Lastly, can you ensure that nouveau is loaded *before* X starts?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448301483.abEFb0BE1.27062
Date: Mon, 23 Nov 2015 17:58:03 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Oliver Neukum from <a href="show_bug.cgi?id=92991#c8">comment #8</a>)
<span class="quote">&gt; With runpm=0 I get full output of xrandr. Without it, it is an instant crash:
&gt; 
&gt; Screen 0: minimum 8 x 8, current 1600 x 900, maximum 32767 x 32767
&gt; eDP1 connected primary 1600x900+0+0 (normal left inverted right x axis y
&gt; axis) 382mm x 215mm
&gt;    1600x900      60.01*+  40.00  
&gt;    1024x768      60.00  
&gt;    800x600       60.32    56.25  
&gt;    640x480       59.94  
&gt; VGA1 disconnected (normal left inverted right x axis y axis)
&gt; VIRTUAL1 disconnected (normal left inverted right x axis y axis)
&gt; DisplayPort-1-0 disconnected (normal left inverted right x axis y axis)
&gt; DisplayPort-1-1 disconnected (normal left inverted right x axis y axis)
&gt; DisplayPort-1-2 connected (normal left inverted right x axis y axis)
&gt;    1680x1050     59.88 +  59.95  </span >

Those connector names look like they're from xf86-video-modesetting, not
xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
version of xf86-video-intel are you using? SNA or UXA?

I definitely know that earlier modesetting various had various issues with
reverse prime... when you say &quot;lockup&quot;, do you really mean &quot;lockup&quot;, or &quot;system
working perfectly fine with the minor exception that the display stops
updating&quot;?

Lastly, can you ensure that nouveau is loaded *before* X starts?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448301483.abEFb0BE1.27062--

--===============0028819577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0028819577==--
