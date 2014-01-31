From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Fri, 31 Jan 2014 09:21:36 +0000
Message-ID: <bug-74164-8800-gt0pbGouZw@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575293494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0575293494==
Content-Type: multipart/alternative; boundary="1391160096.BA52bfAB1.15147"; charset="us-ascii"


--1391160096.BA52bfAB1.15147
Date: Fri, 31 Jan 2014 09:21:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #16 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Created attachment 93111
  --> https://bugs.freedesktop.org/attachment.cgi?id=93111&action=edit
dmesg output with debug options enabled

Here is the dmesg output after I applied the debug options. Unfortunately I
can't see any clue of what is going on, maybe you understand something more. No
interesting info in Xorg.0.log, instead.

This dmesg output does not show any info related to either EDID or DDC. The
first lines about connectors and modelines are those that print the usual
standard modelines (being 1024x768 the higher one).

I had a look to nouveau_connector.c, but, sorry, I can't follow it too much.
What I have seen is that I don't see any debug output there, unfortunately, but
also that I don't see in my logs some error messages like the one that is
produced at this line:

NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
                                 drm_get_connector_name(connector));

which seems to be releted to a problem acquiring the EDID. So, the code flow
must follow another path...

Any idea?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391160096.BA52bfAB1.15147
Date: Fri, 31 Jan 2014 09:21:36 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=93111" name="attach_93111" title="dmesg output with debug options enabled">attachment 93111</a> <a href="attachment.cgi?id=93111&amp;action=edit" title="dmesg output with debug options enabled">[details]</a></span>
dmesg output with debug options enabled

Here is the dmesg output after I applied the debug options. Unfortunately I
can't see any clue of what is going on, maybe you understand something more. No
interesting info in Xorg.0.log, instead.

This dmesg output does not show any info related to either EDID or DDC. The
first lines about connectors and modelines are those that print the usual
standard modelines (being 1024x768 the higher one).

I had a look to nouveau_connector.c, but, sorry, I can't follow it too much.
What I have seen is that I don't see any debug output there, unfortunately, but
also that I don't see in my logs some error messages like the one that is
produced at this line:

NV_ERROR(drm, &quot;DDC responded, but no EDID for %s\n&quot;,
                                 drm_get_connector_name(connector));

which seems to be releted to a problem acquiring the EDID. So, the code flow
must follow another path...

Any idea?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391160096.BA52bfAB1.15147--

--===============0575293494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0575293494==--
