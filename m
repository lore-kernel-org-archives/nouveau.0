From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90435] [NV46] moving 3D objects drawn static
Date: Tue, 26 May 2015 07:17:23 +0000
Message-ID: <bug-90435-8800-8gubXD203m@http.bugs.freedesktop.org/>
References: <bug-90435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874932795=="
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


--===============1874932795==
Content-Type: multipart/alternative; boundary="1432624643.F435A61.14702"; charset="UTF-8"


--1432624643.F435A61.14702
Date: Tue, 26 May 2015 07:17:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90435

Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede-rxtnV0ftBwyoClj4AeEUqw@public.gmane.org
                   |                            |g

--- Comment #10 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #8)
> (In reply to Hans de Goede from comment #7)
> > Hi Ilya,
> > 
> > (In reply to Ilya from comment #6)
> > > What I not changed - is the kernel driver nouveau. It was the last version
> > > from the kernel...
> > 
> > I've tried to reproduce your problem and 10.4 (and newer) for me only show a
> > black window with glxgears, not even a static picture.
> 
> OK, 2 people telling me that the whole everything is broken... probably time
> to plug in my NV44 and see what's is going on.
> 
> Hans, can you confirm which HW you were using to reproduce this?

I'm using a Asus EN7300TC512

> Did you get your hands on an actual NV46, same as the OP? PCIe, I presume?

According to glxinfo it is a NV46, yes, and yes it is a PCIe card.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432624643.F435A61.14702
Date: Tue, 26 May 2015 07:17:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jwrdegoede&#64;fedoraproject.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] moving 3D objects drawn static"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90435">bug 90435</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90435#c8">comment #8</a>)
<span class="quote">&gt; (In reply to Hans de Goede from <a href="show_bug.cgi?id=90435#c7">comment #7</a>)
&gt; &gt; Hi Ilya,
&gt; &gt; 
&gt; &gt; (In reply to Ilya from <a href="show_bug.cgi?id=90435#c6">comment #6</a>)
&gt; &gt; &gt; What I not changed - is the kernel driver nouveau. It was the last version
&gt; &gt; &gt; from the kernel...
&gt; &gt; 
&gt; &gt; I've tried to reproduce your problem and 10.4 (and newer) for me only show a
&gt; &gt; black window with glxgears, not even a static picture.
&gt; 
&gt; OK, 2 people telling me that the whole everything is broken... probably time
&gt; to plug in my NV44 and see what's is going on.
&gt; 
&gt; Hans, can you confirm which HW you were using to reproduce this?</span >

I'm using a Asus EN7300TC512

<span class="quote">&gt; Did you get your hands on an actual NV46, same as the OP? PCIe, I presume?</span >

According to glxinfo it is a NV46, yes, and yes it is a PCIe card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432624643.F435A61.14702--

--===============1874932795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1874932795==--
