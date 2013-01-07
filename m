From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] [NV4B] nVidia Geforce 7300 fails to properly
	resume
Date: Mon, 07 Jan 2013 16:56:40 +0000
Message-ID: <bug-23223-8800-qMl2YI5F7b@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1702140355=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23223-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1702140355==
Content-Type: multipart/alternative; boundary="1357577800.1bAFC2C82.6686"; charset="us-ascii"


--1357577800.1bAFC2C82.6686
Date: Mon, 7 Jan 2013 16:56:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #18 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72637
  --> https://bugs.freedesktop.org/attachment.cgi?id=72637&action=edit
script limitter

VBIOS contains some scripts, which are normally run by BIOS.
Nouveau executes those scripts:
1) when it detects the card is uninitialized
2) when NvForcePost=1 option is passed
3) on resume

It seems Nouveau does something wrong on your card when it executes those
scripts. So, if we will fix boot with NvForcePost=1, we will also fix the
resume issue.

Now, how to fix boot with NvForcePost=1? Good question ;).
Figuring out which script makes the trouble will probably make it easier.
With the above patch you will be able to tell how many scripts are executed and
then limit which one to execute by passing module parameters: minscript and
maxscript. Try it. (start by setting maxscript only)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357577800.1bAFC2C82.6686
Date: Mon, 7 Jan 2013 16:56:40 +0000
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
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72637" name="attach_72637" title="script limitter">attachment 72637</a> <a href="attachment.cgi?id=72637&amp;action=edit" title="script limitter">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=23223&amp;attachment=72637'>[review]</a>
script limitter

VBIOS contains some scripts, which are normally run by BIOS.
Nouveau executes those scripts:
1) when it detects the card is uninitialized
2) when NvForcePost=1 option is passed
3) on resume

It seems Nouveau does something wrong on your card when it executes those
scripts. So, if we will fix boot with NvForcePost=1, we will also fix the
resume issue.

Now, how to fix boot with NvForcePost=1? Good question ;).
Figuring out which script makes the trouble will probably make it easier.
With the above patch you will be able to tell how many scripts are executed and
then limit which one to execute by passing module parameters: minscript and
maxscript. Try it. (start by setting maxscript only)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357577800.1bAFC2C82.6686--

--===============1702140355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1702140355==--
