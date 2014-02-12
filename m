From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] [NV34] TV Load not detected in X
Date: Wed, 12 Feb 2014 20:26:37 +0000
Message-ID: <bug-74903-8800-vTXILM4c61@http.bugs.freedesktop.org/>
References: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288863041=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74903-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1288863041==
Content-Type: multipart/alternative; boundary="1392236797.46A7c2.18485"; charset="us-ascii"


--1392236797.46A7c2.18485
Date: Wed, 12 Feb 2014 20:26:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74903

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|TV Load not detected in X   |[NV34] TV Load not detected
                   |                            |in X

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What happens if you're in X (with the image off) and then try to switch back to
the console? Does it come on, or is it off forever?

I don't see any relevant changes between 3.11.2 and 3.11.6... would be very
interesitng to know what causes the additional regression -- it should be a
pretty fast bisect, if you're up for it.

What kernel were you using before the upgrade? I'm guessing "ancient" (like
pre-3.7)?

It would also be interesting to see a dmesg from semi-working boot (i.e.
3.11.2) and X loading, with "nouveau.debug=debug drm.debug=0xe" options added
to the kernel cmdline.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392236797.46A7c2.18485
Date: Wed, 12 Feb 2014 20:26:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">bug 74903</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>TV Load not detected in X
           </td>
           <td>[NV34] TV Load not detected in X
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">bug 74903</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What happens if you're in X (with the image off) and then try to switch back to
the console? Does it come on, or is it off forever?

I don't see any relevant changes between 3.11.2 and 3.11.6... would be very
interesitng to know what causes the additional regression -- it should be a
pretty fast bisect, if you're up for it.

What kernel were you using before the upgrade? I'm guessing &quot;ancient&quot; (like
pre-3.7)?

It would also be interesting to see a dmesg from semi-working boot (i.e.
3.11.2) and X loading, with &quot;nouveau.debug=debug drm.debug=0xe&quot; options added
to the kernel cmdline.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392236797.46A7c2.18485--

--===============1288863041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1288863041==--
