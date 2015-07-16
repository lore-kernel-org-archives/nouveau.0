From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91354] [NV108] Quadro K610M: "xset dpms force on"
 blinks the screen
Date: Thu, 16 Jul 2015 00:24:21 +0000
Message-ID: <bug-91354-8800-VWdvCQhTYx@http.bugs.freedesktop.org/>
References: <bug-91354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0180573523=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0180573523==
Content-Type: multipart/alternative; boundary="1437006260.fBC4Bcb1.10595"; charset="UTF-8"


--1437006260.fBC4Bcb1.10595
Date: Thu, 16 Jul 2015 00:24:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91354

Vincent Lefevre <vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Quadro K610M] "xset dpms   |[NV108] Quadro K610M: "xset
                   |force on" blinks the screen |dpms force on" blinks the
                   |                            |screen

--- Comment #2 from Vincent Lefevre <vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> How is the relevant screen connected?

This is a HP ZBook 15 G2 laptop with its screen (no external monitor).

> What GPU is this? (Looking for a GKxxx type code.)

lspci gives:

01:00.0 VGA compatible controller: NVIDIA Corporation GK208GLM [Quadro K610M]
(rev a1)

And from the dmesg saved in another bug report:

[   14.178208] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)

> Do you also get a blink when you just run 'xrandr'?

No.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437006260.fBC4Bcb1.10595
Date: Thu, 16 Jul 2015 00:24:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:vincent-fdt&#64;vinc17.net" title="Vincent Lefevre &lt;vincent-fdt&#64;vinc17.net&gt;"> <span class="fn">Vincent Lefevre</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: &quot;xset dpms force on&quot; blinks the screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91354">bug 91354</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Quadro K610M] &quot;xset dpms force on&quot; blinks the screen
           </td>
           <td>[NV108] Quadro K610M: &quot;xset dpms force on&quot; blinks the screen
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: &quot;xset dpms force on&quot; blinks the screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91354#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: &quot;xset dpms force on&quot; blinks the screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91354">bug 91354</a>
              from <span class="vcard"><a class="email" href="mailto:vincent-fdt&#64;vinc17.net" title="Vincent Lefevre &lt;vincent-fdt&#64;vinc17.net&gt;"> <span class="fn">Vincent Lefevre</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91354#c1">comment #1</a>)
<span class="quote">&gt; How is the relevant screen connected?</span >

This is a HP ZBook 15 G2 laptop with its screen (no external monitor).

<span class="quote">&gt; What GPU is this? (Looking for a GKxxx type code.)</span >

lspci gives:

01:00.0 VGA compatible controller: NVIDIA Corporation GK208GLM [Quadro K610M]
(rev a1)

And from the dmesg saved in another bug report:

[   14.178208] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)

<span class="quote">&gt; Do you also get a blink when you just run 'xrandr'?</span >

No.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437006260.fBC4Bcb1.10595--

--===============0180573523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0180573523==--
