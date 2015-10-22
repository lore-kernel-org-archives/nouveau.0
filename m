From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Thu, 22 Oct 2015 03:27:59 +0000
Message-ID: <bug-91779-8800-t4uAxOnPgg@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1587046461=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1587046461==
Content-Type: multipart/alternative; boundary="1445484479.ee42a2.12062"; charset="UTF-8"


--1445484479.ee42a2.12062
Date: Thu, 22 Oct 2015 03:27:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jeremy Huddleston Sequoia from comment #11)
> So now that *I'm* up and running, what can we do to help out Joe User here? 
> I'll try out a newer kernel to see if NvForcePost=1 is still required, and
> if not, maybe we'll need a quirk.  And what can we do to get the firmware
> for Joe User?

Did you have a chance to do that? Not sure what can be done for Joe User here
-- we need the vbios. No vbios = no go. VBIOS has info about what connectors
are on the board, how they're hooked up, any scripts that need to be run to
init the card (necessary on resume), scripts to run when changing modes, etc.

It's likely that the EFI bios brings the card up enough to fool nouveau into
thinking that the card is initialized (which it is), but it sets *something* up
differently and nouveau doesn't reset it properly. But the VBIOS init routines
do. So I think Joe User will be stuck having to do the NvForcePost. [You can
look at what all vbios init does with the help of nvbios in envytools.]

Now in order to operate the screen, EFI needs the VBIOS as well. So it has it
somewhere... the usual thing to do is to stick it at the top of PRAMIN for the
OS to be able to read it down the line. Not sure if you have access to modify
something like that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445484479.ee42a2.12062
Date: Thu, 22 Oct 2015 03:27:59 +0000
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
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jeremy Huddleston Sequoia from <a href="show_bug.cgi?id=91779#c11">comment #11</a>)
<span class="quote">&gt; So now that *I'm* up and running, what can we do to help out Joe User here? 
&gt; I'll try out a newer kernel to see if NvForcePost=1 is still required, and
&gt; if not, maybe we'll need a quirk.  And what can we do to get the firmware
&gt; for Joe User?</span >

Did you have a chance to do that? Not sure what can be done for Joe User here
-- we need the vbios. No vbios = no go. VBIOS has info about what connectors
are on the board, how they're hooked up, any scripts that need to be run to
init the card (necessary on resume), scripts to run when changing modes, etc.

It's likely that the EFI bios brings the card up enough to fool nouveau into
thinking that the card is initialized (which it is), but it sets *something* up
differently and nouveau doesn't reset it properly. But the VBIOS init routines
do. So I think Joe User will be stuck having to do the NvForcePost. [You can
look at what all vbios init does with the help of nvbios in envytools.]

Now in order to operate the screen, EFI needs the VBIOS as well. So it has it
somewhere... the usual thing to do is to stick it at the top of PRAMIN for the
OS to be able to read it down the line. Not sure if you have access to modify
something like that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445484479.ee42a2.12062--

--===============1587046461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1587046461==--
