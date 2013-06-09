From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65554] CPU lock with nouveau_fan_update
Date: Sun, 09 Jun 2013 01:01:28 +0000
Message-ID: <bug-65554-8800-6ySsVwBGLy@http.bugs.freedesktop.org/>
References: <bug-65554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1348619404=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1348619404==
Content-Type: multipart/alternative; boundary="1370739687.073DFa41.3612"; charset="us-ascii"


--1370739687.073DFa41.3612
Date: Sun, 9 Jun 2013 01:01:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65554

--- Comment #2 from ddamienn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #1)
> If delay is somehow 0, the ->alarm will cause nouveau_fan_update to get
> called immediately. Can you add a printk to that function that shows the
> values? (This may end up totally flooding your dmesg too... but I think the
> values may be the same across prints.)

Thanks for your help. I will try to add the printk. The lock has made the
machine inaccessible remotely, so it'll be a couple of days until I can post
the results.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370739687.073DFa41.3612
Date: Sun, 9 Jun 2013 01:01:27 +0000
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
   title="NEW --- - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554">bug 65554</a>
              from <span class="vcard"><a class="email" href="mailto:ddamienn&#64;gmail.com" title="ddamienn&#64;gmail.com">ddamienn&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=65554#c1">comment #1</a>)
<span class="quote">&gt; If delay is somehow 0, the -&gt;alarm will cause nouveau_fan_update to get
&gt; called immediately. Can you add a printk to that function that shows the
&gt; values? (This may end up totally flooding your dmesg too... but I think the
&gt; values may be the same across prints.)</span >

Thanks for your help. I will try to add the printk. The lock has made the
machine inaccessible remotely, so it'll be a couple of days until I can post
the results.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370739687.073DFa41.3612--

--===============1348619404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1348619404==--
