From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89620] Nouveau driver for Nvidia card GeForce GT
	550M]
Date: Mon, 13 Apr 2015 17:42:07 +0000
Message-ID: <bug-89620-8800-vtqHMsFRkr@http.bugs.freedesktop.org/>
References: <bug-89620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686632390=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0686632390==
Content-Type: multipart/alternative; boundary="1428946927.fAffF0e42.3174"; charset="UTF-8"


--1428946927.fAffF0e42.3174
Date: Mon, 13 Apr 2015 17:42:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89620

--- Comment #6 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to George R. Goffe from comment #5)
> As far as I know the driver IS present. This problem seems to have gone away
> with a newer kernel.
> 
> Which laptop are you talking about? Mine is an Asus n53sn.

If the problem is gone, thats fine, yet i tried to tell you how i read your
logs ;-)

And one is the the nouveau driver for X is not found: (from your Xorg.0.log)
nouveau not found:
[   245.501] (II) LoadModule: "nouveau"
[   245.502] (WW) Warning, couldn't open module nouveau
[   245.502] (II) UnloadModule: "nouveau"
[   245.502] (II) Unloading nouveau
[   245.502] (EE) Failed to load module "nouveau" (module does not exist, 0)
intel drives the display:
[   245.619] (II) intel(0): switch to mode 1366x768@60.0 on LVDS1 using pipe 0,
position (0, 0), rotation normal, reflection none
[   245.634] (II) intel(0): switch to mode 1920x1080@60.0 on HDMI1 using pipe
1, position (0, 0), rotation normal, reflection none

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428946927.fAffF0e42.3174
Date: Mon, 13 Apr 2015 17:42:07 +0000
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
   title="NEW - Nouveau driver for Nvidia card GeForce GT 550M]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89620#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver for Nvidia card GeForce GT 550M]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89620">bug 89620</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to George R. Goffe from <a href="show_bug.cgi?id=89620#c5">comment #5</a>)
<span class="quote">&gt; As far as I know the driver IS present. This problem seems to have gone away
&gt; with a newer kernel.
&gt; 
&gt; Which laptop are you talking about? Mine is an Asus n53sn.</span >

If the problem is gone, thats fine, yet i tried to tell you how i read your
logs ;-)

And one is the the nouveau driver for X is not found: (from your Xorg.0.log)
nouveau not found:
[   245.501] (II) LoadModule: &quot;nouveau&quot;
[   245.502] (WW) Warning, couldn't open module nouveau
[   245.502] (II) UnloadModule: &quot;nouveau&quot;
[   245.502] (II) Unloading nouveau
[   245.502] (EE) Failed to load module &quot;nouveau&quot; (module does not exist, 0)
intel drives the display:
[   245.619] (II) intel(0): switch to mode <a href="mailto:1366x768&#64;60.0">1366x768&#64;60.0</a> on LVDS1 using pipe 0,
position (0, 0), rotation normal, reflection none
[   245.634] (II) intel(0): switch to mode <a href="mailto:1920x1080&#64;60.0">1920x1080&#64;60.0</a> on HDMI1 using pipe
1, position (0, 0), rotation normal, reflection none</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428946927.fAffF0e42.3174--

--===============0686632390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0686632390==--
