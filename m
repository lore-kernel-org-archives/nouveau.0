From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93405] nouveau: Xorg crashes sooner or later in
	3840x2160 mode
Date: Sat, 23 Jan 2016 16:35:09 +0000
Message-ID: <bug-93405-8800-h86BMiFd3n@http.bugs.freedesktop.org/>
References: <bug-93405-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130243478=="
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


--===============1130243478==
Content-Type: multipart/alternative; boundary="14535669090.EAb3.5079";
 charset="UTF-8"


--14535669090.EAb3.5079
Date: Sat, 23 Jan 2016 16:35:09 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93405

--- Comment #14 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
  Now that tells us what is officially supported. I have just yielded
3840x2160@30 with an Nvidia G96GLM [Quadro FX 770M] (Windows 7) which is a very
similar but better card than the Nvidia G96M [Geforce 9600M GT] as mentioned in
this report. This even though my Celsius H270 just has a DVI output; I have
converted it into HDMI with an adapter and plugged the HDMI2.0 cable into the
HDMI1.4 port of my u2868pqu monitor. The Amilo Xi3650 notebook as shipped with
the G96M card [ Geforce 9600M GT] on the other hand would have a native HDMI
output (can`t tell on whether it is HDMI1.4 or sth else though).
  Pierre, may I come back to you after I have compiled kernel 4.4 and as far as
recommended a fitting Xorg? If there was a chance to get the card running under
3840x2160@30 with perflvl 0f I would really like to give that a try. Even much
more important I had some painful problems with s2ram and the u2868pqu which
are device driver related (kernel bug 108561). Perhaps you can help me with
this issue as well; have my full endeavor if you think that you can do
something about it.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535669090.EAb3.5079
Date: Sat, 23 Jan 2016 16:35:09 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau: Xorg crashes sooner or later in 3840x2160 mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93405">bug 93405</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>  Now that tells us what is officially supported. I have just yielded
3840x2160&#64;30 with an Nvidia G96GLM [Quadro FX 770M] (Windows 7) which is a very
similar but better card than the Nvidia G96M [Geforce 9600M GT] as mentioned in
this report. This even though my Celsius H270 just has a DVI output; I have
converted it into HDMI with an adapter and plugged the HDMI2.0 cable into the
HDMI1.4 port of my u2868pqu monitor. The Amilo Xi3650 notebook as shipped with
the G96M card [ Geforce 9600M GT] on the other hand would have a native HDMI
output (can`t tell on whether it is HDMI1.4 or sth else though).
  Pierre, may I come back to you after I have compiled kernel 4.4 and as far as
recommended a fitting Xorg? If there was a chance to get the card running under
3840x2160&#64;30 with perflvl 0f I would really like to give that a try. Even much
more important I had some painful problems with s2ram and the u2868pqu which
are device driver related (kernel bug 108561). Perhaps you can help me with
this issue as well; have my full endeavor if you think that you can do
something about it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535669090.EAb3.5079--

--===============1130243478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1130243478==--
