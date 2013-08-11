From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62835] Screen freezes after resume from s2ram
Date: Sun, 11 Aug 2013 16:14:06 +0000
Message-ID: <bug-62835-8800-2C5UpKZOAL@http.bugs.freedesktop.org/>
References: <bug-62835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0674478581=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0674478581==
Content-Type: multipart/alternative; boundary="1376237646.EB7DcB3.23599"; charset="us-ascii"


--1376237646.EB7DcB3.23599
Date: Sun, 11 Aug 2013 16:14:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62835

--- Comment #5 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> Can you isolate(bisect) the offending commit ?

It's not really possible :( The complete story goes like this:

1. Back in 3.7 everything was working fine.
2. In 3.8-rc2 resume was not working with the black screen problem
3. After some time the black screen was fixed but I now had the problem
described in this bug.

If I bisect to a completely working system I'll end up before 3.8-rc2 as in bug
59057.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376237646.EB7DcB3.23599
Date: Sun, 11 Aug 2013 16:14:06 +0000
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
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835">bug 62835</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=62835#c4">comment #4</a>)
<span class="quote">&gt; Can you isolate(bisect) the offending commit ?</span >

It's not really possible :( The complete story goes like this:

1. Back in 3.7 everything was working fine.
2. In 3.8-rc2 resume was not working with the black screen problem
3. After some time the black screen was fixed but I now had the problem
described in this bug.

If I bisect to a completely working system I'll end up before 3.8-rc2 as in <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Black screen after resume from s2ram"
   href="show_bug.cgi?id=59057">bug
59057</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376237646.EB7DcB3.23599--

--===============0674478581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0674478581==--
