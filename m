From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Wed, 02 Jul 2014 17:55:23 +0000
Message-ID: <bug-76483-8800-9nNFAxVRAl@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1658058446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1658058446==
Content-Type: multipart/alternative; boundary="1404323723.cd0f3.8186"; charset="us-ascii"


--1404323723.cd0f3.8186
Date: Wed, 2 Jul 2014 17:55:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #28 from Karl Schendel <schendel-zf86OBlHRo2+XT7JhA+gdA@public.gmane.org> ---
Created attachment 102152
  --> https://bugs.freedesktop.org/attachment.cgi?id=102152&action=edit
debug output from 3.6.3

Don't know if this will help any, but 3.6.3 was the last kernel in which I was
able to a) run nouveau successfully and b) have the full monitor-off timeout
stuff work.

I don't pretend that I tried every in-between version, but in general between
3.7 and 3.11 I was never able to find the right magic words to get any kind of
operational display, or perhaps things were broken.  3.11 onwards works but
then we have the DP DPMS issue which is the original point of this bug report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404323723.cd0f3.8186
Date: Wed, 2 Jul 2014 17:55:23 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:schendel&#64;kbcomputer.com" title="Karl Schendel &lt;schendel&#64;kbcomputer.com&gt;"> <span class="fn">Karl Schendel</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=102152" name="attach_102152" title="debug output from 3.6.3">attachment 102152</a> <a href="attachment.cgi?id=102152&amp;action=edit" title="debug output from 3.6.3">[details]</a></span>
debug output from 3.6.3

Don't know if this will help any, but 3.6.3 was the last kernel in which I was
able to a) run nouveau successfully and b) have the full monitor-off timeout
stuff work.

I don't pretend that I tried every in-between version, but in general between
3.7 and 3.11 I was never able to find the right magic words to get any kind of
operational display, or perhaps things were broken.  3.11 onwards works but
then we have the DP DPMS issue which is the original point of this bug report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404323723.cd0f3.8186--

--===============1658058446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1658058446==--
