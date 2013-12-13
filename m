From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Fri, 13 Dec 2013 16:57:44 +0000
Message-ID: <bug-58378-8800-0umzG1XQ3p@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0999972924=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0999972924==
Content-Type: multipart/alternative; boundary="1386953864.b11eaDA45.18783"; charset="us-ascii"


--1386953864.b11eaDA45.18783
Date: Fri, 13 Dec 2013 16:57:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #22 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello Ilia,

regarding (a) and (b): I am just waiting for a rpmbuild of an OL6 version of
3.13-rc3 to finish and will report back on my findings and include a dmesg
output from that version.

Regarding (c):

Would'nt it make more sense than starting with 3.6 release and 3.7 release tags
to first rule out the "mega commit"?

Can you give me the git commands (or point me to a doc that tells me how to
produce them) for getting "ordinary kernel tarballs" out of the DRM nouveau git
just like the ones published on

https://www.kernel.org/pub/linux/kernel/v3.0/testing/

for two points in time in between 3.6 and 3.7:

(1) for the version up to the immediate commit BEFORE the "mega commit"
(2) for the version exactly matching the "mega commit"?

Using these two kernel tarballs, I could then either confirm or rule out the
"mega commit" as the root cause for the issue, and in the (unlikely) case the
mega commit can indeed be ruled out, I could then concentrate on further
narrowing down the commits

* either between 3.6 and the mega commit if build (1) is already broken
* or between the mega commit and 3.7 if build (2) still works, but 3.7 fails?

Sorry, but rather than pulling the whole git on my poor old laptop and starting
a huge number of bisection attemps "into the blue", I think that this makes
more sense and does not require me to become a git expert in order to try and
help tracking this down... ;-)

What do you think?

I will report back shortly with my 3.13-rc3 results...

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386953864.b11eaDA45.18783
Date: Fri, 13 Dec 2013 16:57:44 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello Ilia,

regarding (a) and (b): I am just waiting for a rpmbuild of an OL6 version of
3.13-rc3 to finish and will report back on my findings and include a dmesg
output from that version.

Regarding (c):

Would'nt it make more sense than starting with 3.6 release and 3.7 release tags
to first rule out the &quot;mega commit&quot;?

Can you give me the git commands (or point me to a doc that tells me how to
produce them) for getting &quot;ordinary kernel tarballs&quot; out of the DRM nouveau git
just like the ones published on

<a href="https://www.kernel.org/pub/linux/kernel/v3.0/testing/">https://www.kernel.org/pub/linux/kernel/v3.0/testing/</a>

for two points in time in between 3.6 and 3.7:

(1) for the version up to the immediate commit BEFORE the &quot;mega commit&quot;
(2) for the version exactly matching the &quot;mega commit&quot;?

Using these two kernel tarballs, I could then either confirm or rule out the
&quot;mega commit&quot; as the root cause for the issue, and in the (unlikely) case the
mega commit can indeed be ruled out, I could then concentrate on further
narrowing down the commits

* either between 3.6 and the mega commit if build (1) is already broken
* or between the mega commit and 3.7 if build (2) still works, but 3.7 fails?

Sorry, but rather than pulling the whole git on my poor old laptop and starting
a huge number of bisection attemps &quot;into the blue&quot;, I think that this makes
more sense and does not require me to become a git expert in order to try and
help tracking this down... ;-)

What do you think?

I will report back shortly with my 3.13-rc3 results...

BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386953864.b11eaDA45.18783--

--===============0999972924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0999972924==--
