From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70326] [NVF0] Kernel/Driver fails to initialize
 acceleration on GTX Titan
Date: Fri, 14 Mar 2014 13:45:55 +0000
Message-ID: <bug-70326-8800-W3RJl3n4ex@http.bugs.freedesktop.org/>
References: <bug-70326-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0199103136=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70326-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0199103136==
Content-Type: multipart/alternative; boundary="1394804755.858A8f2.23707"; charset="us-ascii"


--1394804755.858A8f2.23707
Date: Fri, 14 Mar 2014 13:45:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70326

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I have a branch where I've started fixing some stuff for gk110/gk208... it's
largely untested, feel free to give it a shot:

https://github.com/imirkin/mesa/commits/gk110

Among other things, a floating point subtract was treated as an add, which
couldn't have helped.

The latest kernel (3.14-rcX) should provide nouveau firmware for nvf0, so you
shouldn't need the blob fw anymore.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394804755.858A8f2.23707
Date: Fri, 14 Mar 2014 13:45:55 +0000
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
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70326#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70326">bug 70326</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I have a branch where I've started fixing some stuff for gk110/gk208... it's
largely untested, feel free to give it a shot:

<a href="https://github.com/imirkin/mesa/commits/gk110">https://github.com/imirkin/mesa/commits/gk110</a>

Among other things, a floating point subtract was treated as an add, which
couldn't have helped.

The latest kernel (3.14-rcX) should provide nouveau firmware for nvf0, so you
shouldn't need the blob fw anymore.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394804755.858A8f2.23707--

--===============0199103136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0199103136==--
