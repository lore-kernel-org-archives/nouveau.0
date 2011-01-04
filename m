From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32453] SIGABRT caused by malloc around RegionCreate.
 Can only reproduce with nouveau not vesa.
Date: Tue,  4 Jan 2011 02:05:14 -0800 (PST)
Message-ID: <20110104100514.83CE113004F@annarchy.freedesktop.org>
References: <bug-32453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzI0NTMKCi0tLSBD
b21tZW50ICMzIGZyb20gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gMjAxMS0w
MS0wNCAwMjowNToxMyBQU1QgLS0tCklzIHRoZXJlIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhl
IG1hbGxvYyBmYWlsdXJlIGluIHRoZSBYIHNlcnZlciBzdGRlcnIKb3V0cHV0PyBTaG91bGQgYmUg
Y2FwdHVyZWQgaW4gdGhlIGdkbS9rZG0gbG9nIGZpbGUuCgotLSAKQ29uZmlndXJlIGJ1Z21haWw6
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvdXNlcnByZWZzLmNnaT90YWI9ZW1haWwKLS0t
LS0tLSBZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZTogLS0tLS0tLQpZb3UgYXJl
IHRoZSBhc3NpZ25lZSBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
