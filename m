From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] [NVE7] NULL deref when putting card back to
 sleep after unsuccessful init (HUB_INIT timeout)
Date: Mon, 04 Aug 2014 22:26:42 +0000
Message-ID: <bug-82152-8800-8tvsvDQx4R@http.bugs.freedesktop.org/>
References: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0999995595=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0999995595==
Content-Type: multipart/alternative; boundary="1407191202.e2BBCbDA0.18838"; charset="us-ascii"


--1407191202.e2BBCbDA0.18838
Date: Mon, 4 Aug 2014 22:26:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82152

--- Comment #5 from Patrick Burroughs <celticmadman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I get the same crash and HUB_INIT timeout after the patch. Attaching dmesg.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407191202.e2BBCbDA0.18838
Date: Mon, 4 Aug 2014 22:26:42 +0000
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
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">bug 82152</a>
              from <span class="vcard"><a class="email" href="mailto:celticmadman&#64;gmail.com" title="Patrick Burroughs &lt;celticmadman&#64;gmail.com&gt;"> <span class="fn">Patrick Burroughs</span></a>
</span></b>
        <pre>I get the same crash and HUB_INIT timeout after the patch. Attaching dmesg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407191202.e2BBCbDA0.18838--

--===============0999995595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0999995595==--
