From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95213] New: no screens found(EE)
Date: Sat, 30 Apr 2016 13:11:14 +0000
Message-ID: <bug-95213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1364964145=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1364964145==
Content-Type: multipart/alternative; boundary="14620218740.a06dA.10314";
 charset="UTF-8"


--14620218740.a06dA.10314
Date: Sat, 30 Apr 2016 13:11:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95213

            Bug ID: 95213
           Summary: no screens found(EE)
           Product: Mesa
           Version: 11.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: swojskichlopak-5tc4TXWwyLM@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 123368
  --> https://bugs.freedesktop.org/attachment.cgi?id=123368&action=edit
Xorg.0.log

Hi!
I use Nvidia GTX 660
nouveau driver worked about year ago,
 games not worked because this was new driver, so not all will work.

#-------------------------------------
$ glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE6
OpenGL core profile version string: 3.1 (Core Profile) Mesa 9.2.5
OpenGL core profile shading language version string: 1.40
OpenGL core profile context flags: (none)
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 9.2.5
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
#------------------------------------

Now worked 3 days (flashing before starting)  and not working.

Xorg
#----------------------
[   686.432] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or
directory)
...
[   686.434] (II) NOUVEAU driver for NVIDIA chipset families :
[   686.434]     RIVA TNT        (NV04)
[   686.434]     RIVA TNT2       (NV05)
[   686.434]     GeForce 256     (NV10)
[   686.434]     GeForce 2       (NV11, NV15)
[   686.434]     GeForce 4MX     (NV17, NV18)
[   686.434]     GeForce 3       (NV20)
[   686.434]     GeForce 4Ti     (NV25, NV28)
[   686.434]     GeForce FX      (NV3x)
[   686.434]     GeForce 6       (NV4x)
[   686.434]     GeForce 7       (G7x)
[   686.434]     GeForce 8       (G8x)
[   686.434]     GeForce GTX 200 (NVA0)
[   686.434]     GeForce GTX 400 (NVC0)
[   686.434] (--) using VT number 8

[   686.445] (WW) Falling back to old probe method for v4l
[   686.445] (II) v4l: Initiating device probe
[   686.445] (EE) [drm] KMS not enabled
[   686.445] (EE) No devices detected.
[   686.445] (EE) 
Fatal server error:
[   686.445] (EE) no screens found(EE) 
[   686.445] (EE) 
Please consult the The X.Org Foundation support 
     at http://pclinuxos.com
#----------------------

From wiki I found:
 "no screens found"  --> ... message telling you that something went wrong ...
 "No devices detected" --> ...xorg.conf file doesn't contain the correct
                               driver(s) for the chipset(s)...
http://www.x.org/wiki/FAQErrorMessages/

Why I'm ask, if I have good Nvidia driver ?
  - I wanted test games from Mesa for friend from forum
     (because mesa not provide 32bit and 64bit together, closed drivers have) 
    but this is not problem, 
     I have also Intel graphic card or I can use vesa driver
http://wiki.ghostbsd.org/index.php?title=How_to_resolve_the_%22fatal_server_error:_no_screen_found%22


I have a questions
- What do with this ? Forget, or report any bugs ?
- Is this a error or deliberately disabling ?
- Exist website for nouveau driver, which hardware it support ?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14620218740.a06dA.10314
Date: Sat, 30 Apr 2016 13:11:14 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - no screens found(EE)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95213">95213</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>no screens found(EE)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>swojskichlopak&#64;wp.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123368" name="attach_123368" title="Xorg.0.log">attachment 123368</a> <a href="attachment.cgi?id=123368&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

Hi!
I use Nvidia GTX 660
nouveau driver worked about year ago,
 games not worked because this was new driver, so not all will work.

#-------------------------------------
$ glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE6
OpenGL core profile version string: 3.1 (Core Profile) Mesa 9.2.5
OpenGL core profile shading language version string: 1.40
OpenGL core profile context flags: (none)
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 9.2.5
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
#------------------------------------

Now worked 3 days (flashing before starting)  and not working.

Xorg
#----------------------
[   686.432] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or
directory)
...
[   686.434] (II) NOUVEAU driver for NVIDIA chipset families :
[   686.434]     RIVA TNT        (NV04)
[   686.434]     RIVA TNT2       (NV05)
[   686.434]     GeForce 256     (NV10)
[   686.434]     GeForce 2       (NV11, NV15)
[   686.434]     GeForce 4MX     (NV17, NV18)
[   686.434]     GeForce 3       (NV20)
[   686.434]     GeForce 4Ti     (NV25, NV28)
[   686.434]     GeForce FX      (NV3x)
[   686.434]     GeForce 6       (NV4x)
[   686.434]     GeForce 7       (G7x)
[   686.434]     GeForce 8       (G8x)
[   686.434]     GeForce GTX 200 (NVA0)
[   686.434]     GeForce GTX 400 (NVC0)
[   686.434] (--) using VT number 8

[   686.445] (WW) Falling back to old probe method for v4l
[   686.445] (II) v4l: Initiating device probe
[   686.445] (EE) [drm] KMS not enabled
[   686.445] (EE) No devices detected.
[   686.445] (EE) 
Fatal server error:
[   686.445] (EE) no screens found(EE) 
[   686.445] (EE) 
Please consult the The X.Org Foundation support 
     at <a href="http://pclinuxos.com">http://pclinuxos.com</a>
#----------------------

From wiki I found:
 &quot;no screens found&quot;  --&gt; ... message telling you that something went wrong ...
 &quot;No devices detected&quot; --&gt; ...xorg.conf file doesn't contain the correct
                               driver(s) for the chipset(s)...
<a href="http://www.x.org/wiki/FAQErrorMessages/">http://www.x.org/wiki/FAQErrorMessages/</a>

Why I'm ask, if I have good Nvidia driver ?
  - I wanted test games from Mesa for friend from forum
     (because mesa not provide 32bit and 64bit together, closed drivers have) 
    but this is not problem, 
     I have also Intel graphic card or I can use vesa driver
<a href="http://wiki.ghostbsd.org/index.php?title=How_to_resolve_the_%22fatal_server_error:_no_screen_found%22">http://wiki.ghostbsd.org/index.php?title=How_to_resolve_the_%22fatal_server_error:_no_screen_found%22</a>


I have a questions
- What do with this ? Forget, or report any bugs ?
- Is this a error or deliberately disabling ?
- Exist website for nouveau driver, which hardware it support ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14620218740.a06dA.10314--

--===============1364964145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1364964145==--
