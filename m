From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91705] [NVE7] GPU crash (read fault) on boot w/
 DMI+HDMI outputs
Date: Thu, 20 Aug 2015 19:17:32 +0000
Message-ID: <bug-91705-8800-WCPSX04gRO@http.bugs.freedesktop.org/>
References: <bug-91705-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1783117451=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91705-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1783117451==
Content-Type: multipart/alternative; boundary="1440098251.B7451.18430"; charset="UTF-8"


--1440098251.B7451.18430
Date: Thu, 20 Aug 2015 19:17:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91705

--- Comment #8 from Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117825
  --> https://bugs.freedesktop.org/attachment.cgi?id=117825&action=edit
vbios.rom

(In reply to Ilia Mirkin from comment #7)
> 
> No idea what we're (not) doing to make those mmio reads fail. As they're
> connected to "power", perhaps they're getting turned off for our
> convenience? Not sure.

Perhaps it *is* relevant, then, that when monitors are connected to VGA and
DVI, both are activated (in mirrored mode) by the BIOS, but when monitors are
connected to HDMI and DVI, *only* the HDMI-attached display is activated by the
BIOS.

> Perhaps it just doesn't have a SOR[3]/DAC[1]? Can you include your VBIOS,
> perhaps there's something interesting in there? From a successful boot, grab
> /sys/kernel/debug/dri/0/vbios.rom and upload it here.

Attached.

This computer is in my office, and I need to go home shortly, but I will be
able to do further experiments tomorrow morning.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440098251.B7451.18430
Date: Thu, 20 Aug 2015 19:17:31 +0000
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
   title="NEW - [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91705#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91705">bug 91705</a>
              from <span class="vcard"><a class="email" href="mailto:zackw&#64;panix.com" title="Zack Weinberg &lt;zackw&#64;panix.com&gt;"> <span class="fn">Zack Weinberg</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117825" name="attach_117825" title="vbios.rom">attachment 117825</a> <a href="attachment.cgi?id=117825&amp;action=edit" title="vbios.rom">[details]</a></span>
vbios.rom

(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91705#c7">comment #7</a>)
<span class="quote">&gt; 
&gt; No idea what we're (not) doing to make those mmio reads fail. As they're
&gt; connected to &quot;power&quot;, perhaps they're getting turned off for our
&gt; convenience? Not sure.</span >

Perhaps it *is* relevant, then, that when monitors are connected to VGA and
DVI, both are activated (in mirrored mode) by the BIOS, but when monitors are
connected to HDMI and DVI, *only* the HDMI-attached display is activated by the
BIOS.

<span class="quote">&gt; Perhaps it just doesn't have a SOR[3]/DAC[1]? Can you include your VBIOS,
&gt; perhaps there's something interesting in there? From a successful boot, grab
&gt; /sys/kernel/debug/dri/0/vbios.rom and upload it here.</span >

Attached.

This computer is in my office, and I need to go home shortly, but I will be
able to do further experiments tomorrow morning.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440098251.B7451.18430--

--===============1783117451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1783117451==--
