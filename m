From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90435] [NV46] moving 3D objects drawn static
Date: Wed, 27 May 2015 15:28:34 +0000
Message-ID: <bug-90435-8800-uJw5RXYRGn@http.bugs.freedesktop.org/>
References: <bug-90435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1248879808=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90435-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1248879808==
Content-Type: multipart/alternative; boundary="1432740513.56fDB61.23313"; charset="UTF-8"


--1432740513.56fDB61.23313
Date: Wed, 27 May 2015 15:28:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90435

--- Comment #13 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to Ilya from comment #12)
> (In reply to Hans de Goede from comment #11)
> > Hi all,
> > 
> > I've been looking into this toay, it seems that with the latest
> > xf86-video-nouveau + latest mesa (both git master) I can reproduce the
> > problem and work around it by starting glxgears like this:
> > 
> > "vblank_mode=0 glxgears"
> > 
> > I need this workaround on both mesa-10.0 and mesa-git-master, so it seems
> > that whatever problem Ilya was original seeing has been fixed in
> > mesa-git-master.
> > 
> > Ilya can you please try mesa-git-master and if that does not work (the
> > vblank issue may be specific to my card), try it with: "vblank_mode=0
> > glxgears" ?
> > 
> 
> I have not already tested git-version, but the mesa 10.5.5 from Arch the
> vblank_mode=0 works good for me. glxgears, lugaru, sauerbraten work fine
> (slow, but, it wokrs).

Great, thanks for testing, then it seems you've the same issue. I'll try to
investigate this further Friday (tomorrow I've some other items I need to look
into).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432740513.56fDB61.23313
Date: Wed, 27 May 2015 15:28:33 +0000
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
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to Ilya from <a href="show_bug.cgi?id=90435#c12">comment #12</a>)
<span class="quote">&gt; (In reply to Hans de Goede from <a href="show_bug.cgi?id=90435#c11">comment #11</a>)
&gt; &gt; Hi all,
&gt; &gt; 
&gt; &gt; I've been looking into this toay, it seems that with the latest
&gt; &gt; xf86-video-nouveau + latest mesa (both git master) I can reproduce the
&gt; &gt; problem and work around it by starting glxgears like this:
&gt; &gt; 
&gt; &gt; &quot;vblank_mode=0 glxgears&quot;
&gt; &gt; 
&gt; &gt; I need this workaround on both mesa-10.0 and mesa-git-master, so it seems
&gt; &gt; that whatever problem Ilya was original seeing has been fixed in
&gt; &gt; mesa-git-master.
&gt; &gt; 
&gt; &gt; Ilya can you please try mesa-git-master and if that does not work (the
&gt; &gt; vblank issue may be specific to my card), try it with: &quot;vblank_mode=0
&gt; &gt; glxgears&quot; ?
&gt; &gt; 
&gt; 
&gt; I have not already tested git-version, but the mesa 10.5.5 from Arch the
&gt; vblank_mode=0 works good for me. glxgears, lugaru, sauerbraten work fine
&gt; (slow, but, it wokrs).</span >

Great, thanks for testing, then it seems you've the same issue. I'll try to
investigate this further Friday (tomorrow I've some other items I need to look
into).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432740513.56fDB61.23313--

--===============1248879808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1248879808==--
