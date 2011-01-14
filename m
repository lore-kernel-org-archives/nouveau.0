From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32453] SIGABRT caused by malloc around
 exaPrepareAccessReg_mixed
Date: Fri, 14 Jan 2011 01:01:32 -0800 (PST)
Message-ID: <20110114090132.CD4E813004F@annarchy.freedesktop.org>
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
b21tZW50ICM5IGZyb20gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gMjAxMS0w
MS0xNCAwMTowMTozMSBQU1QgLS0tCldlbGwsIHRoZSBiYWNrdHJhY2VzIGZyb20gdGhlIFhvcmcg
YW5kIGdkbSBsb2cgZmlsZXMgYW5kIGZyb20gZ2RiIGFsbCBsb29rCmRpZmZlcmVudC4gOn0gU28g
YXMgaW4gYnVnIDMyNDUzLCB0aGUgcmVhbCBwcm9ibGVtIGNvdWxkIGJlIG1lbW9yeSBjb3JydXB0
aW9uCnNvbWV3aGVyZSBlbHNlIHdoaWNoIGlzIG9ubHkgY2F1Z2h0IGluIHRoZXNlIHBsYWNlcy4K
CkFwYXJ0IGZyb20gcnVubmluZyB0aGUgWCBzZXJ2ZXIgaW4gdmFsZ3JpbmQsIGdldHRpbmcgYSBn
ZGIgYmFja3RyYWNlIGZvciB0aGUKZnJlZSgpIGZhaWx1cmUgaW4gdGhlIGdkbSBsb2cgZmlsZSBt
aWdodCBiZSB1c2VmdWwuCgotLSAKQ29uZmlndXJlIGJ1Z21haWw6IGh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvdXNlcnByZWZzLmNnaT90YWI9ZW1haWwKLS0tLS0tLSBZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZTogLS0tLS0tLQpZb3UgYXJlIHRoZSBhc3NpZ25lZSBmb3Ig
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
