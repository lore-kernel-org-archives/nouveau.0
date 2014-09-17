From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77333] [NV108] Unable to use nouveau GK208 as
 offloadsink provider
Date: Wed, 17 Sep 2014 02:21:40 +0000
Message-ID: <bug-77333-8800-lYfqajEslz@http.bugs.freedesktop.org/>
References: <bug-77333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0956706923=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0956706923==
Content-Type: multipart/alternative; boundary="1410920500.82ad41.28005"; charset="us-ascii"


--1410920500.82ad41.28005
Date: Wed, 17 Sep 2014 02:21:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77333

Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #11 from Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #10)
> (In reply to comment #9)
> > Can you confirm that you were also using mesa 10.2.x? (10.2.2 and later
> > should work largely fine on GK208.)
> 
> I can't remember if I was, but I can try again and report back. Will try
> this out today.

"Today" happened, I was able to test and now it works!

$ DRI_PRIME=0 glxinfo | grep "OpenGL vendor string"
OpenGL vendor string: Intel Open Source Technology Center

$ DRI_PRIME=1 glxinfo | grep "OpenGL vendor string"
OpenGL vendor string: nouveau

$ DRI_PRIME=1 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
6721 frames in 5.0 seconds = 1344.181 FPS

(that's such a lie, but at least it's working!)

This is with kernel 3.16.2-200.fc20, xorg 1.14.4, mesa-10.1.5,
xf86-video-nouveau-1.0.10. I wasn't able to find Fedora 20 packages for
mesa-10.2.x, but I'm guessing this works with 10.2 as well.

Closing as FIXED, thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410920500.82ad41.28005
Date: Wed, 17 Sep 2014 02:21:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nirbheek.chauhan&#64;gmail.com" title="Nirbheek Chauhan &lt;nirbheek.chauhan&#64;gmail.com&gt;"> <span class="fn">Nirbheek Chauhan</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV108] Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV108] Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV108] Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
              from <span class="vcard"><a class="email" href="mailto:nirbheek.chauhan&#64;gmail.com" title="Nirbheek Chauhan &lt;nirbheek.chauhan&#64;gmail.com&gt;"> <span class="fn">Nirbheek Chauhan</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77333#c10">comment #10</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=77333#c9">comment #9</a>)
&gt; &gt; Can you confirm that you were also using mesa 10.2.x? (10.2.2 and later
&gt; &gt; should work largely fine on GK208.)
&gt; 
&gt; I can't remember if I was, but I can try again and report back. Will try
&gt; this out today.</span >

&quot;Today&quot; happened, I was able to test and now it works!

$ DRI_PRIME=0 glxinfo | grep &quot;OpenGL vendor string&quot;
OpenGL vendor string: Intel Open Source Technology Center

$ DRI_PRIME=1 glxinfo | grep &quot;OpenGL vendor string&quot;
OpenGL vendor string: nouveau

$ DRI_PRIME=1 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
6721 frames in 5.0 seconds = 1344.181 FPS

(that's such a lie, but at least it's working!)

This is with kernel 3.16.2-200.fc20, xorg 1.14.4, mesa-10.1.5,
xf86-video-nouveau-1.0.10. I wasn't able to find Fedora 20 packages for
mesa-10.2.x, but I'm guessing this works with 10.2 as well.

Closing as FIXED, thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410920500.82ad41.28005--

--===============0956706923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0956706923==--
