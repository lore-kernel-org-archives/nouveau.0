From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] [NVE7] NULL deref when putting card back to
 sleep after unsuccessful init (HUB_INIT timeout)
Date: Sat, 16 Apr 2016 12:16:38 +0000
Message-ID: <bug-82152-8800-GnXDtQlD13@http.bugs.freedesktop.org/>
References: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0236224129=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0236224129==
Content-Type: multipart/alternative; boundary="14608089980.7CfC2A.15846";
 charset="UTF-8"


--14608089980.7CfC2A.15846
Date: Sat, 16 Apr 2016 12:16:38 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=82152

--- Comment #11 from Patrick Burroughs <celti-ND9dHWfaFg1BDLzU/O5InQ@public.gmane.org> ---
Created attachment 122992
  --> https://bugs.freedesktop.org/attachment.cgi?id=122992&action=edit
dmesg output with errors from successful load

With Linux 4.5.0-ARCH, Mesa 11.1.2-3, DRI3, and using modesetting_drv instead
of intel_drv for the main display (not sure if that's relevant)... everything
works! (If "everything" consists of glxinfo, glxgears, and a few minutes of
Darwinia.)

I do still get errors in dmesg, though, as attached. I'll be happy to follow
along and do whatever digging is necessary to eradicate them, if someone wants
to take up that task.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14608089980.7CfC2A.15846
Date: Sat, 16 Apr 2016 12:16:38 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">bug 82152</a>
              from <span class="vcard"><a class="email" href="mailto:celti&#64;celti.name" title="Patrick Burroughs &lt;celti&#64;celti.name&gt;"> <span class="fn">Patrick Burroughs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122992" name="attach_122992" title="dmesg output with errors from successful load">attachment 122992</a> <a href="attachment.cgi?id=122992&amp;action=edit" title="dmesg output with errors from successful load">[details]</a></span>
dmesg output with errors from successful load

With Linux 4.5.0-ARCH, Mesa 11.1.2-3, DRI3, and using modesetting_drv instead
of intel_drv for the main display (not sure if that's relevant)... everything
works! (If &quot;everything&quot; consists of glxinfo, glxgears, and a few minutes of
Darwinia.)

I do still get errors in dmesg, though, as attached. I'll be happy to follow
along and do whatever digging is necessary to eradicate them, if someone wants
to take up that task.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14608089980.7CfC2A.15846--

--===============0236224129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0236224129==--
