From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73607] [v3.13-rc8][regression] NULL pointer
 dereference in nouveau_gpuobj_create_
Date: Tue, 14 Jan 2014 14:41:18 +0000
Message-ID: <bug-73607-8800-7lfC6xGXVj@http.bugs.freedesktop.org/>
References: <bug-73607-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663305256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73607-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0663305256==
Content-Type: multipart/alternative; boundary="1389710478.beA01.9481"; charset="us-ascii"


--1389710478.beA01.9481
Date: Tue, 14 Jan 2014 14:41:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73607

--- Comment #2 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92044
  --> https://bugs.freedesktop.org/attachment.cgi?id=92044&action=edit
Kernel patch

I recreated the patch for the mere mortals using the regular kernel driver. I
hope I'm doing this correctly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389710478.beA01.9481
Date: Tue, 14 Jan 2014 14:41:18 +0000
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
   title="NEW --- - [v3.13-rc8][regression] NULL pointer dereference in nouveau_gpuobj_create_"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73607#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [v3.13-rc8][regression] NULL pointer dereference in nouveau_gpuobj_create_"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73607">bug 73607</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92044" name="attach_92044" title="Kernel patch">attachment 92044</a> <a href="attachment.cgi?id=92044&amp;action=edit" title="Kernel patch">[details]</a></span>
Kernel patch

I recreated the patch for the mere mortals using the regular kernel driver. I
hope I'm doing this correctly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389710478.beA01.9481--

--===============0663305256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0663305256==--
