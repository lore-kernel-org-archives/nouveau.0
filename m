From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83168] [NV46] No display after suspend to RAM
Date: Thu, 28 Aug 2014 18:52:15 +0000
Message-ID: <bug-83168-8800-sUgOuNqdYn@http.bugs.freedesktop.org/>
References: <bug-83168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0606178622=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0606178622==
Content-Type: multipart/alternative; boundary="1409251934.AdDDdD072.24372"; charset="us-ascii"


--1409251934.AdDDdD072.24372
Date: Thu, 28 Aug 2014 18:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83168

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> (In reply to comment #6)
> > So... it worked in debian. What linux kernel was that with?
> 
> Sorry, I don't remember.

OK. Well, the most likely way for you to get this resolved is to identify the
kernel commit that caused the issue. In order to do that you need to find a
kernel version that worked fine. Good candidates to try out are

3.2
3.6
3.9

(IIRC 3.2 is what one of the debian versions likes to use, 3.6 is before 3.7
which had a ton of changes, and 3.10 had a bunch as well iirc.) If any of those
works, you need to do a bisect between that version and whatever the earliest
kernel you're aware of that *doesn't* work. Hopefully it won't be some
mega-change-everything commit.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409251934.AdDDdD072.24372
Date: Thu, 28 Aug 2014 18:52:14 +0000
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
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168">bug 83168</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=83168#c7">comment #7</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=83168#c6">comment #6</a>)
&gt; &gt; So... it worked in debian. What linux kernel was that with?
&gt; 
&gt; Sorry, I don't remember.</span >

OK. Well, the most likely way for you to get this resolved is to identify the
kernel commit that caused the issue. In order to do that you need to find a
kernel version that worked fine. Good candidates to try out are

3.2
3.6
3.9

(IIRC 3.2 is what one of the debian versions likes to use, 3.6 is before 3.7
which had a ton of changes, and 3.10 had a bunch as well iirc.) If any of those
works, you need to do a bisect between that version and whatever the earliest
kernel you're aware of that *doesn't* work. Hopefully it won't be some
mega-change-everything commit.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409251934.AdDDdD072.24372--

--===============0606178622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0606178622==--
