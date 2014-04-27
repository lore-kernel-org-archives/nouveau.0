From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 27 Apr 2014 07:34:36 +0000
Message-ID: <bug-54700-8800-FRINS96rU2@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1231455509=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1231455509==
Content-Type: multipart/alternative; boundary="1398584076.eF4E6D24.30553"; charset="us-ascii"


--1398584076.eF4E6D24.30553
Date: Sun, 27 Apr 2014 07:34:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|unspecified                 |6.7.0

--- Comment #55 from nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> ---
I also have this problem. Everything unaccelerated comes up as trash, even on
the kernel framebuffer (if acceleration was switched off). Or for example I can
see most of the graphics ok, but if I use ShadowFB then the whole screen is
unusable. And the cursor is garbage too most of the time.

This is nothing new, but I found a way to make it work.

I have two systems installed (latest debian/testing). I boot the first one to X
with the nvidia drivers. Then I use kexec to boot into the second system (also
debian/testing), which is using nouveau. And at this time, all the graphics are
fine!

So something is initialized by the nvidia driver, which is not touched by
nouveau but is required for correct operation.

Is there a way I could help? Like dumping register states with/without the
nvidia init?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398584076.eF4E6D24.30553
Date: Sun, 27 Apr 2014 07:34:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Version</td>
           <td>unspecified
           </td>
           <td>6.7.0
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c55">Comment # 55</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span></b>
        <pre>I also have this problem. Everything unaccelerated comes up as trash, even on
the kernel framebuffer (if acceleration was switched off). Or for example I can
see most of the graphics ok, but if I use ShadowFB then the whole screen is
unusable. And the cursor is garbage too most of the time.

This is nothing new, but I found a way to make it work.

I have two systems installed (latest debian/testing). I boot the first one to X
with the nvidia drivers. Then I use kexec to boot into the second system (also
debian/testing), which is using nouveau. And at this time, all the graphics are
fine!

So something is initialized by the nvidia driver, which is not touched by
nouveau but is required for correct operation.

Is there a way I could help? Like dumping register states with/without the
nvidia init?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398584076.eF4E6D24.30553--

--===============1231455509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1231455509==--
