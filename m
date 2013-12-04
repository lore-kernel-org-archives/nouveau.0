From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Wed, 04 Dec 2013 21:43:21 +0000
Message-ID: <bug-64323-8800-D42YCdOXnv@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650198367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1650198367==
Content-Type: multipart/alternative; boundary="1386193401.56Fc1Fd4.21086"; charset="us-ascii"


--1386193401.56Fc1Fd4.21086
Date: Wed, 4 Dec 2013 21:43:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #29 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The wait is correct and always needed. I believe that the last patch is
actually incorrect. I've added a whole bunch of comments to that function which
reflect my understanding of how it works. It appears to be correct.

I think what's happening is that

(a) inline write to GART. no staging, just returns the buffer's memory
(b) something happens
(c) inline write to GART. at this point, the GPU is now reading the buffer. so
it has to do the whole staging dance to schedule the write to be done by the
GPU.
(d) render happens, and has to wait for that second inline write to complete.

I have yet to figure out what (b) is -- I did some printf-debugging and I'm
fairly sure about parts (a) and (c). But by the time (c) happened, the buffer's
status had the GPU_READING bit set, and it had a ->fence set on it.

I made yet-another attempt at improving this by forcing the second inline write
to wait for the gpu to stop reading and then do the GART copy directly, but
that didn't seem to help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386193401.56Fc1Fd4.21086
Date: Wed, 4 Dec 2013 21:43:21 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The wait is correct and always needed. I believe that the last patch is
actually incorrect. I've added a whole bunch of comments to that function which
reflect my understanding of how it works. It appears to be correct.

I think what's happening is that

(a) inline write to GART. no staging, just returns the buffer's memory
(b) something happens
(c) inline write to GART. at this point, the GPU is now reading the buffer. so
it has to do the whole staging dance to schedule the write to be done by the
GPU.
(d) render happens, and has to wait for that second inline write to complete.

I have yet to figure out what (b) is -- I did some printf-debugging and I'm
fairly sure about parts (a) and (c). But by the time (c) happened, the buffer's
status had the GPU_READING bit set, and it had a -&gt;fence set on it.

I made yet-another attempt at improving this by forcing the second inline write
to wait for the gpu to stop reading and then do the GART copy directly, but
that didn't seem to help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386193401.56Fc1Fd4.21086--

--===============1650198367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1650198367==--
