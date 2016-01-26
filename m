From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Tue, 26 Jan 2016 20:18:45 +0000
Message-ID: <bug-93405-8800-6fK0QtVzIH@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1593307755=="
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


--===============1593307755==
Content-Type: multipart/alternative; boundary="14538395251.dB3D.6299";
 charset="UTF-8"


--14538395251.dB3D.6299
Date: Tue, 26 Jan 2016 20:18:45 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #16 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Great! With nouveau.hdmimhz=225 I can yield such modes like 3840x2160@23/24Hz
whereby 23Hz is stable and 24Hz sometimes starts to flurr. For those who prefer
a higher freuquency 2560x1600@47 should be a tip. 25MHz for 2840x2160 will make
my display stay black and 48Hz for 2560x1600 results in considerable pixel
flurring. I have also tried it with 3840x2160@48i interlaced. However with all
3840x2160 interlaced modes the mouse pointer disappears. I can still move the
mouse highlighting the icons where the mouse moves over but the mouse pointer
will be no more visible as soon as I select an interlaced mode. I don`t know
whether a fix would be possible for the interlacing mouse pointer issue but
that would even give a better 4K experience on elder cards as modes with
24/25/30Hz yield a somewhat deferred moving of animated objects like the mouse
pointer. Nonetheless the joy of running a full 4K display with my Nvidia G96M
[GeForce 9600M GT] is a thriving experience. To make this report complete
nouveau.hdmimhz=297 will let my HDMI output simply stay black. The support of
the hdmimhz parameter is an amazing feature that no proprietary driver will
give; neat work!

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14538395251.dB3D.6299
Date: Tue, 26 Jan 2016 20:18:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Great! With nouveau.hdmimhz=225 I can yield such modes like 3840x2160&#64;23/24Hz
whereby 23Hz is stable and 24Hz sometimes starts to flurr. For those who prefer
a higher freuquency 2560x1600&#64;47 should be a tip. 25MHz for 2840x2160 will make
my display stay black and 48Hz for 2560x1600 results in considerable pixel
flurring. I have also tried it with 3840x2160&#64;48i interlaced. However with all
3840x2160 interlaced modes the mouse pointer disappears. I can still move the
mouse highlighting the icons where the mouse moves over but the mouse pointer
will be no more visible as soon as I select an interlaced mode. I don`t know
whether a fix would be possible for the interlacing mouse pointer issue but
that would even give a better 4K experience on elder cards as modes with
24/25/30Hz yield a somewhat deferred moving of animated objects like the mouse
pointer. Nonetheless the joy of running a full 4K display with my Nvidia G96M
[GeForce 9600M GT] is a thriving experience. To make this report complete
nouveau.hdmimhz=297 will let my HDMI output simply stay black. The support of
the hdmimhz parameter is an amazing feature that no proprietary driver will
give; neat work!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14538395251.dB3D.6299--

--===============1593307755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1593307755==--
