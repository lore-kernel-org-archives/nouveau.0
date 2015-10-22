From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91236] [NVC3] Passive DP to HDMI adapter cannot use
 pixel clocks greater than 165 MHz
Date: Thu, 22 Oct 2015 04:11:27 +0000
Message-ID: <bug-91236-8800-FI4GDxTeMq@http.bugs.freedesktop.org/>
References: <bug-91236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946310100=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91236-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0946310100==
Content-Type: multipart/alternative; boundary="1445487087.b80d02d42.23840"; charset="UTF-8"


--1445487087.b80d02d42.23840
Date: Thu, 22 Oct 2015 04:11:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91236

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrew Boettcher from comment #2)
> Created attachment 119057 [details]
> Video Bios

Blast! According to my theory you'd only have 225MHz on this card. You're sure
about 297MHz working? FTR my theory is that the bit 'T' table contains this
info, which with your vbios is:

BIT table 'T' version 1 at 0x02d8 length 0x0002
Unknown BIT table 'T' version 1
0x02d8: 41 b5

0000b540  71 20 0d 04 00 00 50 32  74 40 e8 80 e4 57 5b fd  |q ....P2t@...W[.|

0x4074 = 16500 (single-link dvi)
0x80e8 = 33000 (dual-link dvi)
0x57e4 = 22500 -- my theory for max hdmi link speed

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445487087.b80d02d42.23840
Date: Thu, 22 Oct 2015 04:11:27 +0000
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
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236">bug 91236</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrew Boettcher from <a href="show_bug.cgi?id=91236#c2">comment #2</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=119057" name="attach_119057" title="Video Bios">attachment 119057</a> <a href="attachment.cgi?id=119057&amp;action=edit" title="Video Bios">[details]</a></span>
&gt; Video Bios</span >

Blast! According to my theory you'd only have 225MHz on this card. You're sure
about 297MHz working? FTR my theory is that the bit 'T' table contains this
info, which with your vbios is:

BIT table 'T' version 1 at 0x02d8 length 0x0002
Unknown BIT table 'T' version 1
0x02d8: 41 b5

0000b540  71 20 0d 04 00 00 50 32  74 40 e8 80 e4 57 5b fd  |q ....P2t&#64;...W[.|

0x4074 = 16500 (single-link dvi)
0x80e8 = 33000 (dual-link dvi)
0x57e4 = 22500 -- my theory for max hdmi link speed</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445487087.b80d02d42.23840--

--===============0946310100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0946310100==--
