From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Fri, 26 Jul 2013 18:09:10 +0000
Message-ID: <bug-67315-8800-9iLMSYiGqT@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2011733869=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2011733869==
Content-Type: multipart/alternative; boundary="1374862150.ab6cC241.17138"; charset="us-ascii"


--1374862150.ab6cC241.17138
Date: Fri, 26 Jul 2013 18:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #3 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
On 07/25/2013 05:01 PM, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org issued this missive:
> *Comment # 2 <https://bugs.freedesktop.org/show_bug.cgi?id=67315#c2> on
> bug 67315 <https://bugs.freedesktop.org/show_bug.cgi?id=67315> from Emil
> Velikov <mailto:emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> *
>
> Hi Rick
>
> Before jumping to compulsions can you configure your Xserver to not load
> * libglamoregl.so
> * vesa_drv.so
> * modesetting_drv.so
>
> The last two should be ignored if you use an xorg.conf as shown in here [1].
> Whereas for the first one you could try an temporary rename the file (there may
> be a better way to handle it, which I'm not aware of).

There is no xorg.conf file. This is a fresh, virgin install of Fedora
19, then updated.

> With that said, try and narrow down what's causing the issue. A scenario such
> as
> * as soon as my screensaver kicks in
> * using program XX
> * doing action A, while using program YY, followed by action C.
>
> As the issue occurs, try and attach the complete output of dmesg (or save the
> output to a file and attach at a later point)

I stated that it appears to occur when the screen saver starts and I did
include the dmesg data that started to spew out when the problem occurs.
That being said, I will restart everything and disable the screen saver
completely.

----------------------------------------------------------------------
- Rick Stevens, Systems Engineer, AllDigital    ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org -
- AIM/Skype: therps2        ICQ: 22643734            Yahoo: origrps2 -
-                                                                    -
-    When you don't know what to do, walk fast and look worried.     -
----------------------------------------------------------------------

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374862150.ab6cC241.17138
Date: Fri, 26 Jul 2013 18:09:10 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>On 07/25/2013 05:01 PM, <a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a> issued this missive:
<span class="quote">&gt; *<a href="show_bug.cgi?id=67315#c2">Comment # 2</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="show_bug.cgi?id=67315#c2">https://bugs.freedesktop.org/show_bug.cgi?id=67315#c2</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="show_bug.cgi?id=67315">bug 67315</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="show_bug.cgi?id=67315">https://bugs.freedesktop.org/show_bug.cgi?id=67315</a>&gt; from Emil
&gt; Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">mailto:emil.l.velikov&#64;gmail.com</a>&gt; *</span >
&gt;
<span class="quote">&gt; Hi Rick</span >
&gt;
<span class="quote">&gt; Before jumping to compulsions can you configure your Xserver to not load
&gt; * libglamoregl.so
&gt; * vesa_drv.so
&gt; * modesetting_drv.so</span >
&gt;
<span class="quote">&gt; The last two should be ignored if you use an xorg.conf as shown in here [1].
&gt; Whereas for the first one you could try an temporary rename the file (there may
&gt; be a better way to handle it, which I'm not aware of).</span >

There is no xorg.conf file. This is a fresh, virgin install of Fedora
19, then updated.

<span class="quote">&gt; With that said, try and narrow down what's causing the issue. A scenario such
&gt; as
&gt; * as soon as my screensaver kicks in
&gt; * using program XX
&gt; * doing action A, while using program YY, followed by action C.</span >
&gt;
<span class="quote">&gt; As the issue occurs, try and attach the complete output of dmesg (or save the
&gt; output to a file and attach at a later point)</span >

I stated that it appears to occur when the screen saver starts and I did
include the dmesg data that started to spew out when the problem occurs.
That being said, I will restart everything and disable the screen saver
completely.

----------------------------------------------------------------------
- Rick Stevens, Systems Engineer, AllDigital    <a href="mailto:ricks&#64;alldigital.com">ricks&#64;alldigital.com</a> -
- AIM/Skype: therps2        ICQ: 22643734            Yahoo: origrps2 -
-                                                                    -
-    When you don't know what to do, walk fast and look worried.     -
----------------------------------------------------------------------</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374862150.ab6cC241.17138--

--===============2011733869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2011733869==--
