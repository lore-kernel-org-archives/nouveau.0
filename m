From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] [NVAC] Trying to register nv_backlight after
	NV96 did it
Date: Sat, 23 Jan 2016 11:55:51 +0000
Message-ID: <bug-86539-8800-zb2nq2MLnD@http.bugs.freedesktop.org/>
References: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2140080310=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86539-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2140080310==
Content-Type: multipart/alternative; boundary="14535501511.9c86E890.29501";
 charset="UTF-8"


--14535501511.9c86E890.29501
Date: Sat, 23 Jan 2016 11:55:51 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=86539

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Updated to 4.4, and still getting the same issue (which is still solved by
using NvForcePost=1).

I'm not sure how backlight is supposed to be managed in a multi-screen (same
backlight value set for all screens attached to a card?) and/or multi-gpu
situation (one backlight value per card?), but:

* If each card can have it's own backlight configuration, shouldn't the naming
of Nouveau's backlight path (/sys/class/nv_backlight) take that into account,
to avoid different cards registering to the same backlight entry point?

* When should a backlight interface be registered? If connectors are found,
regardless of if any screens are connected to those? Currently Nouveau iterates
over all LVDS and eDP connectors of a device, and will register one if the
"brightness value" (NV50_PDISP_SOR_PWM_CTL(i)) is different of 0. So if a
device has an LVDS connector and a eDP one, both will try to register a
backlight under the same name (nv_backlight) if I understand the code
correctly.

Anyone who could weight in, Ben or Hans maybe?

Attached two dmesgs, one without the NvForcePost, the other with. It's
interesting to see that both see the connectors the same way, but due to
NV50_PDISP_SOR_PWM_CTL having a different value (as outlined in comment #1),
one will try to register and additional backlight while the other won't.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535501511.9c86E890.29501
Date: Sat, 23 Jan 2016 11:55:51 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">bug 86539</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Updated to 4.4, and still getting the same issue (which is still solved by
using NvForcePost=1).

I'm not sure how backlight is supposed to be managed in a multi-screen (same
backlight value set for all screens attached to a card?) and/or multi-gpu
situation (one backlight value per card?), but:

* If each card can have it's own backlight configuration, shouldn't the naming
of Nouveau's backlight path (/sys/class/nv_backlight) take that into account,
to avoid different cards registering to the same backlight entry point?

* When should a backlight interface be registered? If connectors are found,
regardless of if any screens are connected to those? Currently Nouveau iterates
over all LVDS and eDP connectors of a device, and will register one if the
&quot;brightness value&quot; (NV50_PDISP_SOR_PWM_CTL(i)) is different of 0. So if a
device has an LVDS connector and a eDP one, both will try to register a
backlight under the same name (nv_backlight) if I understand the code
correctly.

Anyone who could weight in, Ben or Hans maybe?

Attached two dmesgs, one without the NvForcePost, the other with. It's
interesting to see that both see the connectors the same way, but due to
NV50_PDISP_SOR_PWM_CTL having a different value (as outlined in <a href="show_bug.cgi?id=86539#c1">comment #1</a>),
one will try to register and additional backlight while the other won't.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535501511.9c86E890.29501--

--===============2140080310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2140080310==--
