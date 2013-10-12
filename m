From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Sat, 12 Oct 2013 16:50:31 +0000
Message-ID: <bug-70388-8800-GNwT9JLg12@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0560116868=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0560116868==
Content-Type: multipart/alternative; boundary="1381596631.cFb670da0.17140"; charset="us-ascii"


--1381596631.cFb670da0.17140
Date: Sat, 12 Oct 2013 16:50:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #4 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 87518
  --> https://bugs.freedesktop.org/attachment.cgi?id=87518&action=edit
second failure

Adding 'export MESA_EXTENSION_OVERRIDE=-GL_ARB_framebuffer_object' into
~/.bashrc didn't help. KDE became stuck a few seconds after login again. After
I switched to console terminal the "failed to idle channel 0xcccc0000" failure
happened again. See the aatached log file, taken from 'journalctl -a' output.
Mentioned in the log dump will be attached in the next message.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381596631.cFb670da0.17140
Date: Sat, 12 Oct 2013 16:50:31 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87518" name="attach_87518" title="second failure">attachment 87518</a> <a href="attachment.cgi?id=87518&amp;action=edit" title="second failure">[details]</a></span>
second failure

Adding 'export MESA_EXTENSION_OVERRIDE=-GL_ARB_framebuffer_object' into
~/.bashrc didn't help. KDE became stuck a few seconds after login again. After
I switched to console terminal the &quot;failed to idle channel 0xcccc0000&quot; failure
happened again. See the aatached log file, taken from 'journalctl -a' output.
Mentioned in the log dump will be attached in the next message.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381596631.cFb670da0.17140--

--===============0560116868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0560116868==--
