From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Tue, 26 Jan 2016 22:16:15 +0000
Message-ID: <bug-93405-8800-sL9cpRIBjr@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0829473031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93405-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0829473031==
Content-Type: multipart/alternative; boundary="14538465751.5556C5.26507";
 charset="UTF-8"


--14538465751.5556C5.26507
Date: Tue, 26 Jan 2016 22:16:15 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Elmar Stellnberger from comment #16)
> let my HDMI output simply stay black. The support of the hdmimhz parameter
> is an amazing feature that no proprietary driver will give; neat work!

From the NVIDIA blob readme file:

"""
Option "ModeValidation" "string"

"NoMaxPClkCheck": each mode has a pixel clock; this pixel clock is validated
against the maximum pixel clock of the hardware (for a DFP, this is the maximum
pixel clock of the TMDS encoder, for a CRT, this is the maximum pixel clock of
the DAC). This argument disables the maximum pixel clock checking stage of the
mode validation pipeline.

"NoEdidMaxPClkCheck": a display device's EDID can specify the maximum pixel
clock that the display device supports; a mode's pixel clock is validated
against this pixel clock maximum. This argument disables this stage of the mode
validation pipeline.

"NoMaxSizeCheck": each NVIDIA GPU has a maximum resolution that it can drive;
this argument disables this stage of the mode validation pipeline.
"""

And a whole bunch of others.

(In reply to Elmar Stellnberger from comment #17)
> By the way does anyone know whether there is a similar feature for the
> radeon driver? I have an XFX Radeon R5 230 card which was advertised as 4K
> ready. However I did never get any of the 4K modes to work.

Wrong place to ask.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14538465751.5556C5.26507
Date: Tue, 26 Jan 2016 22:16:15 +0000
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
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Elmar Stellnberger from <a href="show_bug.cgi?id=93405#c16">comment #16</a>)
<span class="quote">&gt; let my HDMI output simply stay black. The support of the hdmimhz parameter
&gt; is an amazing feature that no proprietary driver will give; neat work!</span >

From the NVIDIA blob readme file:

&quot;&quot;&quot;
Option &quot;ModeValidation&quot; &quot;string&quot;

&quot;NoMaxPClkCheck&quot;: each mode has a pixel clock; this pixel clock is validated
against the maximum pixel clock of the hardware (for a DFP, this is the maximum
pixel clock of the TMDS encoder, for a CRT, this is the maximum pixel clock of
the DAC). This argument disables the maximum pixel clock checking stage of the
mode validation pipeline.

&quot;NoEdidMaxPClkCheck&quot;: a display device's EDID can specify the maximum pixel
clock that the display device supports; a mode's pixel clock is validated
against this pixel clock maximum. This argument disables this stage of the mode
validation pipeline.

&quot;NoMaxSizeCheck&quot;: each NVIDIA GPU has a maximum resolution that it can drive;
this argument disables this stage of the mode validation pipeline.
&quot;&quot;&quot;

And a whole bunch of others.

(In reply to Elmar Stellnberger from <a href="show_bug.cgi?id=93405#c17">comment #17</a>)
<span class="quote">&gt; By the way does anyone know whether there is a similar feature for the
&gt; radeon driver? I have an XFX Radeon R5 230 card which was advertised as 4K
&gt; ready. However I did never get any of the 4K modes to work.</span >

Wrong place to ask.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14538465751.5556C5.26507--

--===============0829473031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0829473031==--
